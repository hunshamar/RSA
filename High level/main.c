#include <stdio.h>
#include <stdbool.h>
#include <math.h>



bool is_prime(int n)
{
    if (n == 2)
    {
        return true;
    }
    else if((n < 2) || ((n % 2) == 0))
    {
        return false;
    }
    else
    {
        for (int i = 3; i < (int)floor((sqrt(n))); ++i)
        {
            if (!(n % i))
            {
                return false;
            }
        }
    }
    return true;
}


int phi(n)
{
    if (is_prime(n))
    {
        return --n;
    }
    else
    {
        is_prime(n-1)
    }
}


int main()
{




    printf("hei \n");

    return 0;
}
