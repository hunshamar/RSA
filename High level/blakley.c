#include "bakley.h"
#include <stdint.h>


int blakley_algorithm_8_bit(uint8_t a, uint8_t b, uint8_t n)
{
    int R = 0;
    for (int i = 0; i < 8; ++i)
    {
        R *= 2;
        R += ((a & (1 << (8 - 1 - i))) >> i)*b;
        R = R%n;
        if (R >= n)
        {
            R -= n;
        }
        if (R >= n)
        {
            R -= n;
        }
    }
    return R;
}