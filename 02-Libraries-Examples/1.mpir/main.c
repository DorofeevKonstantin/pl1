#include <stdio.h>
#include <mpir.h>
#include <time.h>
#include <Windows.h>

int main(void)
{
    time_t start, end;
    start = time(NULL);
    mpz_t a, b, c, d, e, f;
    mpz_init(a); mpz_init(b); mpz_init(c); mpz_init(d); mpz_init(e);
    
    mpz_set_str(a, "92764923876429876387642987642983764293424023647470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364", 10);
    mpz_set_str(b, "234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402364234892764923876429876429837642934240236470236470237642376402", 10);
    mpz_add(c, a, b);
    mpz_mul(d, a, b);
    mpz_set_str(d, "1000000000000000000000000000000", 10);
    mpz_powm_ui(e, a, 999999999, d);
    mpz_powm(e, a, b, d);
    for (int i = 0; i < 1000; ++i)
    {
        mpz_powm_ui(e, a, 999999999, d);
        mpz_powm(e, a, b, d);
    }
    
    end = time(NULL);
    printf("spend %lf ms\n", (((double)end - (double)start) / (CLOCKS_PER_SEC / 1000)));
    /*mpz_out_str(stdout, 10, a); printf("\n");
    mpz_out_str(stdout, 10, b); printf("\n");
    mpz_out_str(stdout, 10, c); printf("\n");
    mpz_out_str(stdout, 10, d); printf("\n");*/
    mpz_out_str(stdout, 10, e); printf("\n"); 

    return 0;
}