#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#include <stdlib.h>
#include <stdint.h>

// Binary method

bool get_bit(int number, int n){
    return (number >> n & 0b1 == 1);
}


int blakley_algorithm_32_bit(uint32_t a, uint32_t b, uint32_t n)
{
    int R = 0;
    for (int i = 0; i < 32; ++i)
    {
        R *= 2;
        R += get_bit(a, 31-i)*b;
        //R = R % n;
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


uint32_t modular_exponentiation(uint32_t M, uint32_t e, uint32_t n){ // 32 bit number  
    int k = 32;
    int C;

    if  (get_bit(e, k-1) == 1){ // if MSB = 1;
        C = M;
    }
    else{
        C = 1;
    }

    for (int i = k-2; i >= 0; i--){
        C = blakley_algorithm_32_bit(C,C,n);
        if (get_bit(e, i) == 1){
            C = blakley_algorithm_32_bit(C,M,n);
        }
    }
    return C;
}

int main()
{

    //printf("%d * %d mod %d = %d \n", a, b, n, blakley_algorithm_32_bit(a, b, n));
    //keypair kp = generate_keypair(pr.q, pr.p);
    //printf("Generated keys: \n (e, n) = (%d, %d)\n (d, n) = (%d, %d)\n", kp.private.e, kp.private.n, kp.public.d, kp.public.n);

     int M = 65;
     int e = 17;
     int n = 3233;


    // return M^e % n


    //(number >> n-1 & 0b1 == 1);

  

    // 19^250 mod 119
     //printf("Modular exponentiation normal: %d\n", (int)pow(M, e) % n );

     printf("Modular exponentiation  binary 19^250 mod 119 =  %d\n", modular_exponentiation(M,e,n));

    return 0;
}
