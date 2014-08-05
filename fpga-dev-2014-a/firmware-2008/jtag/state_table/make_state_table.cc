#include <stdio.h>

#include "../states.h"

using namespace JTAG;

/* Depth-first search of the state graph.
 * I meant to write a breadth-first search, but it was late and this works.
 *
 * <start> is the state to start searching from.
 * <end> is the state we're trying to reach.
 * <visited> points to a map of which states have been visited.
 *      Each bit corresponds to a state, with bit 0 for state 0.
 * <path> is the path to reach state <start>.
 */
static State_Path search(State start, State end, uint16_t visited, int len)
{
    State link_state[2];
    State_Path path[2], ret;
    int i;
    
    /* Mark this state as having been visited */
    visited |= 1 << start;
    
    /* Get the states linked from this state */
    link_state[0] = next_state(start, false);
    link_state[1] = next_state(start, true);
    
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
        path[i] = search(link_state[i], end, visited, len + 1);
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

State_Path find_path(State start, State end)
{
#ifdef DEBUG
    printf("Find path: %s -> %s\n", state_name[start], state_name[end]);
#endif
    
    if (start == end)
    {
        State_Path path;
        
        path.tms = 0;
        path.len = 0;
        
        return path;
    }
    
    return search(start, end, 0, 0);
}

void print_path(State_Path path)
{
    int i;
    
    printf("%d: ", path.len);
    for (i = 0; i < path.len; i++)
        printf("%d", (path.tms & (1 << i)) ? 1 : 0);
    printf("\n");
}

void test_reset()
{
	int i, j;
	
    for (i = 0; i < 16; i++)
    {
        State_Path path;
        
        path = find_path((State)i, Test_Logic_Reset);
        
        if (path.len == 0 && i != Test_Logic_Reset)
        {
            printf("  State %d: len == 0\n", i);
            continue;
        }
        
        if (path.len > 5)
        {
            printf("  State %d: path too long (len == %d)\n", i, path.len);
            continue;
        }
        
        for (j = 0; j < path.len; j++)
        {
            if (!(path.tms & (1 << j)))
            {
                printf("  State %d: bit %d is 0\n", i, j);
            }
        }
    }
}

int main()
{
    int start, end;
    
    printf("#include \"states.h\"\n");
    printf("\n");
    printf("JTAG::State_Path JTAG::state_path[16][16] =\n");
    printf("{\n");
    
    for (start = 0; start < 16; start++)
    {
    	printf("    // Starting state %d (%s)\n", start, state_name[start]);
    	printf("    {");
    	
        for (end = 0; end < 16; end++)
        {
            State_Path path = find_path((State)start, (State)end);
            
            if (path.len > 8)
            {
            	fprintf(stderr, "*** Exceeded maximum allowed path length: %s -> %s, %d steps\n",
            		state_name[start], state_name[end], path.len);
            	return 1;
            }
            
            printf("{0x%02x, 0x%02x}", path.len, path.tms);
            if (end < 15)
            {
            	printf(",");
            	if (end == 7)
            		printf("\n     ");
            	else printf(" ");
            }
        }
        
        printf("}");
        if (start < 15)
        	printf(",\n");
        printf("\n");
    }
    
    printf("};\n\n");
    
    return 0;
}
