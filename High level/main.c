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





// 1 Generate two large random primes, p and q, of approximate equal size such that their product n = pq 

typedef struct{
    int q;
    int p;
}primes;

typedef struct{
    int e;
    int n;
}private_key;


typedef struct{
    int d;
    int n;
}public_key;

typedef struct{
    private_key private;
    public_key public;
}keypair;

primes primes_input(){
    primes pr;
    do {
        printf("Enter first prime: ");
        scanf("%d", &pr.q);
    }
    while(!is_prime(pr.q));

    do {
        printf("Enter second prime, must be different than first: ");
        scanf("%d", &pr.p);
    }
    while(!is_prime(pr.p) || pr.q == pr.p);
    return pr;
}

// Greatest common divisor
int gcd(int a, int b){
    while(a != b){
        if (a > b){
            a -= b;
        }  
        else{
            b -= a;
        }
    }
    return a;

}

keypair generate_keypair(int p, int q){
    
    int n = p * q;
    int phi = (p-1)*(q-1);

    // Choose integer e



}

// 2. compute n = pq and ϕ = (p-1)(q-1)

// 3. Choose an integer e, 1 < e < ϕ such that gdc(e,q) = 1 

// 4. compute secret exponent d, 1 < d < ϕ such that ed = 1 mod ϕ

// 5. The public key is (n,e) and the private key (d,p,q). Keep all the values d, p, q and ϕ secret. 
//    [Sometimes the private key is written as (n,d) because you need the value of n when using d. 
//     Other times we might write the key pair as ((N,e),d).]





int main()
{
    //primes pr = primes_input();    
    //printf("You entered primes p: %d and q: %d \n", pr.q, pr.p);

    int a = 12;
    int b = 18;
    int g = gcd(a,b);

    printf("Greatest common divisor of %d and %d = %d \n", a, b, g);

    return 0;
}
