#include <stdio.h>
#include <stdint.h>
#include <assert.h>
#include <pthread.h>

#include "test.hpp"

FILE *out = stdout;
volatile bool reverse_run;

void *reverse_main(void *arg)
{
    uint8_t reverse_packet[Reverse_Size + 2];
    
    reverse_run = true;
    while (reverse_run)
    {
        if (dev->bulk_read(2, reverse_packet, sizeof(reverse_packet)))
        {
#if 0
            for (unsigned int i = 0; i < sizeof(reverse_packet); ++i)
            {
                printf("%02x ", reverse_packet[i]);
            }
            printf("\n");
#else
//            int delta = (int8_t)reverse_packet[6];
            int delta = reverse_packet[8] | (reverse_packet[9] << 8);
            if (!(reverse_packet[6] & 0x01))
            {
                delta = 0xffff;
            }
            printf("%f\n", 65535.0 / delta);
            fprintf(out, "%d\n", delta);
#endif
        } else printf("Reverse timeout\n");
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

void test_speed(const char *name, int file_speed, int speed)
{
    char filename[64];
    snprintf(filename, sizeof(filename), "%s-%03d", name, file_speed);
    out = fopen(filename, "wt");
    if (!out)
    {
        printf("Can't write to %s: %m\n", filename);
        exit(1);
    }
    
    printf("%5s %3d\n", name, file_speed);
    start_reverse();
    for (int i = 0; i < 200; ++i)
    {
        send_motors(speed, 0, 0, 0, 0);
    }
    stop_reverse();
    fclose(out);
}

int main(int argc, char *argv[])
{
    assert(test_init());
    
    for (int speed = 31; speed <= 127; speed += 16)
    {
//        for (int trial = 0; trial < 4; ++trial)
        {
            test_speed("start", speed, speed);
            test_speed("stop", speed, 0);
        }
    }
}
