#include <stdio.h>


// 1 Generate two large random primes, p and q, of approximate equal size such that their product n = pq 

typedef struct{
    int q;
    int p;
}primes;

primes primes_input(){
    primes pr;
    do {
        printf("Enter first prime: ");
        scanf("%d", &pr.q);
    }
    while(!is_bool(pr.q));

    do {
        printf("Enter second prime, must be different than first: ");
        scanf("%d", &pr.p);
    }
    while(!is_bool(pr.p) && pr.q != pr.p);
    return pr;

}

// 2. compute n = pq and ϕ = (p-1)(q-1)

// 3. Choose an integer e, 1 < e < ϕ such that gdc(e,q) = 1 

// 4. compute secret exponent d, 1 < d < ϕ such that ed = 1 mod ϕ

// 5. The public key is (n,e) and the private key (d,p,q). Keep all the values d, p, q and ϕ secret. 
//    [Sometimes the private key is written as (n,d) because you need the value of n when using d. 
//     Other times we might write the key pair as ((N,e),d).]




int main()
{
    primes pr = primes_input();    
    printf("You entered primes p: %d and q: %d \n", pr.q, pr.p);
    

    return 0;
}
