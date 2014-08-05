#include <stdio.h>
#include <stdint.h>
#include <assert.h>
#include <pthread.h>
#include <math.h>
#include <sys/time.h>

#include "test.hpp"

volatile bool reverse_run = false;
volatile int speed = 0;

void *reverse_main(void *arg)
{
    uint8_t reverse_packet[Reverse_Size + 2];
    
    reverse_run = true;
    while (reverse_run)
    {
        if (dev->bulk_read(2, reverse_packet, sizeof(reverse_packet), 250))
        {
            int delta = reverse_packet[8] | (reverse_packet[9] << 8);
            if (!(reverse_packet[6] & 0x01))
            {
                delta = 0xffff;
            }
//            speed = 65535 / delta - 1;
            speed = 65535 - delta;
            if (!(reverse_packet[7] & 0x01))
            {
                speed = -speed;
            }
//            speed = (int8_t)reverse_packet[6];
        }
    }
    
    return 0;
}

pthread_t reverse_thread;

void start_reverse()
{
    pthread_create(&reverse_thread, 0, reverse_main, 0);
}

void stop_reverse()
{
    reverse_run = false;
    pthread_cancel(reverse_thread);
    pthread_join(reverse_thread, 0);
}

const int Num_Criteria = 3;
int score[4][Num_Criteria];
int v_set, min_err, max_overshoot, hit_time;

const int Max_Rate = 32;

void control(float kp, float kd, int n)
{
    min_err = 99999;
    max_overshoot = 0;
    hit_time = 0;
    
    int last_err = 0;
    int last_pwm = 0;
    int pwm = 0;
    for (int frame = 0; frame < 100; ++frame)
    {
        int v = speed;
        int err = v - v_set;
        pwm += (int)(kp * err + kd * (err - last_err));
        last_err = err;
        
        if (abs(err) < min_err)
        {
            min_err = abs(err);
        }
        
        if (err > max_overshoot)
        {
            max_overshoot = err;
        }
        
        if (!hit_time && err >= 0)
        {
            hit_time = frame;
        }
        
#if 1
        if ((pwm - last_pwm) > Max_Rate)
        {
            pwm = last_pwm + Max_Rate;
        } else if ((last_pwm - pwm) > Max_Rate)
        {
            pwm = last_pwm - Max_Rate;
        }
#endif
        
        if (pwm > 127)
        {
            pwm = 127;
        } else if (pwm < -127)
        {
            pwm = -127;
        }
        
        //printf("%3d %3d %4d %4d\n", v_set, v, err, pwm);
        
        send_motors(pwm, 0, 0, 0, 0);
        last_pwm = pwm;
    }
    
    // Stop the motor
    while (speed != 0)
    {
        send_motors(0, 0, 0, 0, 0);
    }
    usleep(100 * 1000);
    
    fprintf(stderr, "%.3f %.3f min error %3d  max overshoot %3d  hit time %3d\n", kp, kd, min_err, max_overshoot, hit_time);
    
    score[n][0] = min_err;
    score[n][1] = max_overshoot;
    score[n][2] = hit_time;
}

int main(int argc, char *argv[])
{
    assert(test_init());
    start_reverse();
    
    v_set = 45000;
    
#if 1
    float kp0 = -0.00001;
    float kp1 = -0.001;

    float kd0 = 0.00001;
    float kd1 = 0.001;
#else
    float kp0 = -0.2;
    float kp1 = -0.4;

    float kd0 = 0.01;
    float kd1 = 0.2;
#endif
    // 25 279 068
    //    324 057
    // 35 266 076
    //    298 055
    
    float kp_center = 0, kd_center = 0;
    
    while (true)//fabs(kp0 - kp1) > 0.02 || fabs(kd0 - kd1) > 0.02)
    {
        kp_center = (kp0 + kp1) / 2;
        float kp_low = (kp0 + kp_center) / 2;
        float kp_high = (kp1 + kp_center) / 2;
        
        kd_center = (kd0 + kd1) / 2;
        float kd_low = (kd0 + kd_center) / 2;
        float kd_high = (kd1 + kd_center) / 2;
        
        printf("range kp %.6f %.6f kd %.3f %.3f\n", kp0, kp1, kd0, kd1);
        
        control(kp_low, kd_low, 0);
        control(kp_high, kd_low, 1);
        control(kp_low, kd_high, 2);
        control(kp_high, kd_high, 3);
        
        // Scoring
        int min_score[Num_Criteria], max_score[Num_Criteria];
        for (int c = 0; c < Num_Criteria; ++c)
        {
            min_score[c] = score[0][c];
            max_score[c] = min_score[c];
            for (int trial = 1; trial < 4; ++trial)
            {
                if (score[trial][c] < min_score[c])
                {
                    min_score[c] = score[trial][c];
                }
                
                if (score[trial][c] > max_score[c])
                {
                    max_score[c] = score[trial][c];
                }
            }
        }
        
        float total_score[4], winner_score = 0;
        int winner = 0;
        for (int trial = 0; trial < 4; ++trial)
        {
            total_score[trial] = 0;
            for (int c = 0; c < Num_Criteria; ++c)
            {
                total_score[trial] += (float)(score[trial][c] - min_score[c]) / (max_score[c] - min_score[c]);
            }
            
            if (trial == 0 || total_score[trial] < winner_score)
            {
                winner_score = total_score[trial];
                winner = trial;
            }
        }
        printf("Scores: %f %f %f %f, %d wins\n", total_score[0], total_score[1], total_score[2], total_score[3], winner);
        
        if (winner == 0)
        {
            kp1 = kp_high;
            kd1 = kd_high;
        } else if (winner == 1)
        {
            kp0 = kp_low;
            kd1 = kd_high;
        } else if (winner == 2)
        {
            kp1 = kp_high;
            kd0 = kd_low;
        } else {
            kp0 = kp_low;
            kd0 = kd_low;
        }
    }
    
    printf("final kp %.6f kd %.3f\n", kp_center, kd_center);

    stop_reverse();
}
