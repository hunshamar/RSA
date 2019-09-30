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
        R = R % n;
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


int modular_exponentiation(int M, int e, int n){ // 8 bit number  
    // Returns C = M^e mod n

    int k = 8;
    int C;

    if  (get_bit(e, k-1) == 1){ // if MSB = 1;
        C = M;
    }
    else{
        C = 1;
    }
    for (int i = k-2; i >= 0; i--){
        C = (C*C) % n;
        if (get_bit(e, i) == 1){
            C = (C*M) % n;
        }
    }
    return C;
}

int main()
{
    //primes pr = primes_input();    
    //printf("You entered primes p: %d and q: %d \n", pr.q, pr.p);

    uint32_t a = 3136789;
    uint32_t b = 3216784;
    uint32_t n = 132;

    printf("%d * %d mod %d = %d \n", a, b, n, blakley_algorithm_32_bit(a, b, n));
    //keypair kp = generate_keypair(pr.q, pr.p);
    //printf("Generated keys: \n (e, n) = (%d, %d)\n (d, n) = (%d, %d)\n", kp.private.e, kp.private.n, kp.public.d, kp.public.n);

    // int M = 19;
    // int e = 250;
    // int n = 119;


    // return M^e % n


    //(number >> n-1 & 0b1 == 1);

  

    // 19^250 mod 119
    // printf("Modular exponentiation normal: %d\n", (int)pow(M, e) % n );

    // printf("Modular exponentiation binary %d\n", modular_exponentiation(M,e,n));

    return 0;
}
