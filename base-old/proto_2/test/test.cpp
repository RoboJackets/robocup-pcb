#include <stdio.h>
#include <assert.h>
#include <pthread.h>

#include "test.hpp"

volatile bool reverse_run = false;
void *reverse_main(void *arg)
{
    uint8_t reverse_packet[Reverse_Size + 2];
    
    reverse_run = true;
    while (reverse_run)
    {
        if (dev->bulk_read(2, reverse_packet, sizeof(reverse_packet), 100))
        {
            for (unsigned int i = 0; i < sizeof(reverse_packet); ++i)
            {
                printf("%02x ", reverse_packet[i]);
            }
            printf("\n");
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

int main(int argc, char *argv[])
{
    assert(test_init());

//    start_reverse();
    while (1)
    {
        send_motors(24, 0, 0, 0, 0);
//		getchar();
    }
}
