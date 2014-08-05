//#define DEBUG

#include <stdio.h>

#include "jtag_state_path.h"

#define LINK(a, b)   (((a) << 4) | (b))
uint8_t jtag_state_graph[16] =
{
    LINK(TEST_LOGIC_RESET,  RUN_TEST_IDLE), /* Test Logic Reset */
    LINK(SELECT_DR,         RUN_TEST_IDLE), /* Run/Test Idle */
    LINK(SELECT_IR,         CAPTURE_DR),    /* Select DR */
    LINK(EXIT1_DR,          SHIFT_DR),      /* Capture DR */
    LINK(EXIT1_DR,          SHIFT_DR),      /* Shift DR */
    LINK(UPDATE_DR,         PAUSE_DR),      /* Exit 1 DR */
    LINK(EXIT2_DR,          PAUSE_DR),      /* Pause DR */
    LINK(UPDATE_DR,         SHIFT_DR),      /* Exit 2 DR */
    LINK(SELECT_DR,         RUN_TEST_IDLE), /* Update DR */
    LINK(TEST_LOGIC_RESET,  CAPTURE_IR),    /* Select IR */
    LINK(EXIT1_IR,          SHIFT_IR),      /* Capture IR */
    LINK(EXIT1_IR,          SHIFT_IR),      /* Shift IR */
    LINK(UPDATE_IR,         PAUSE_IR),      /* Exit 1 IR */
    LINK(EXIT2_IR,          PAUSE_IR),      /* Pause IR */
    LINK(UPDATE_IR,         SHIFT_IR),      /* Exit 2 IR */
    LINK(SELECT_DR,         RUN_TEST_IDLE)  /* Update IR */
};

/* Breadth-first search of the state graph.
 *
 * <start> is the state to start searching from.
 * <end> is the state we're trying to reach.
 * <visited> points to a map of which states have been visited.
 *      Each bit corresponds to a state, with bit 0 for state 0.
 * <path> is the path to reach state <start>.
 */
static jtag_path_t bfs(jtag_state_t start, jtag_state_t end, uint16_t visited, int len)
{
    uint8_t links, link_state[2];
    jtag_path_t path[2], ret;
    int i;
    
    /* Mark this state as having been visited */
    visited |= 1 << start;
    
    /* Get the states linked from this state */
    links = jtag_state_graph[start];
    link_state[1] = links >> 4;
    link_state[0] = links & 15;
    
    for (i = 0; i < 2; i++)
    {
#ifdef DEBUG
//        printf("  %*s%s: choice %d: %s\n", len*2, "", state_name[start], i, state_name[link_state[i]]);
#endif
        
        /* Don't check states that have already been checked */
        if (visited & (1 << link_state[i]))
        {
#ifdef DEBUG
//            printf("  %*s%d: %s already checked\n", len*2, "", i, state_name[link_state[i]]);
#endif
            path[i].len = 0;
            
            continue;
        }
        
        if (link_state[i] == end)
        {
#ifdef DEBUG
            printf("  %*s%d: %s is destination\n", len*2, "", i, state_name[link_state[i]]);
#endif

            /* This is the destination, so return immediately because nothing this
             * state links to will be closer to the starting point through this state.
             */
            ret.len = 1;
            ret.tms = i;
            
            return ret;
        }
        
        /* Try to find a path from this link */
        path[i] = bfs(link_state[i], end, visited, len + 1);
#ifdef DEBUG
//        printf("  %*s%d: %s no path\n", len*2, "", i, state_name[link_state[i]]);
#endif
    }
    
#ifdef DEBUG
    printf("  %*s%s: %s is %d, %s is %d\n", len*2, "", state_name[start], state_name[link_state[0]], path[0].len,
        state_name[link_state[1]], path[1].len);
#endif
    
    /* Find the shortest path, if any, to the destination */
    if (path[0].len && path[1].len)
    {
        if (path[0].len < path[1].len)
        {
            i = 0;
        } else {
            i = 1;
        }
    } else if (path[0].len)
    {
        i = 0;
    } else if (path[1].len)
    {
        i = 1;
    } else {
        /* Didn't find a path */
        ret.len = 0;
        ret.tms = 0;
        
        return ret;
    }
    
    /* The destination is reachable through this link, so add it to the path and return. */
    ret.tms = (path[i].tms << 1) | i;
    ret.len = path[i].len + 1;

#ifdef DEBUG
    printf("  %*s%d: %s has best path %04x\n", len*2, "", i, state_name[link_state[i]], ret.tms);
#endif

    return ret;
}

jtag_path_t jtag_find_path(jtag_state_t start, jtag_state_t end)
{
#ifdef DEBUG
    printf("Find path: %s -> %s\n", state_name[start], state_name[end]);
#endif
    
    if (start == end)
    {
        jtag_path_t path;
        
        path.tms = 0;
        path.len = 0;
        
        return path;
    }
    
    return bfs(start, end, 0, 0);
}
