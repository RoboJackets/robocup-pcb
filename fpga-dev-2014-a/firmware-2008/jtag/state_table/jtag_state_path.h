#ifndef _JTAG_STATE_PATH_H_
#define _JTAG_STATE_PATH_H_

#include <stdint.h>

#include "jtag_states.h"

typedef struct
{
    /* TMS values, starting with the LSB */
    uint16_t tms;
    
    /* Number of bits in TMS that need to be sent (all others are zero) */
    int len;
} jtag_path_t;

#ifdef __cplusplus
extern "C" {
#endif

jtag_path_t jtag_find_path(jtag_state_t start, jtag_state_t end);

#ifdef __cplusplus
};
#endif

/* Connectivity list for the state graph.
 * Bits 7-4 are the next state if TMS=1.
 * Bits 3-0 are the next state if TMS=0.
 */
extern uint8_t jtag_state_graph[16];

/* Returns the state that will be reached when TMS has the given value on a rising edge of TCK */
static inline jtag_state_t jtag_next_state(jtag_state_t state, int tms)
{
    if (tms)
    {
        return (jtag_state_t)(jtag_state_graph[state] >> 4);
    } else {
        return (jtag_state_t)(jtag_state_graph[state] & 15);
    }
}

#endif /* _JTAG_STATE_PATH_H_ */
