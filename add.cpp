#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <math.h>
#include <smmintrin.h>
#include <emmintrin.h>
#include <immintrin.h>
#define MAXN 100000000

float a[MAXN];
float b[MAXN];
float c[MAXN];
float d[MAXN];

int main()
{
    for (int i = 0; i < MAXN; ++i)
    {
        a[i] = 1.0 / (rand() + 1);
        b[i] = 1.0 / (rand() + 1);
    }
    for (int n = 0; n < 20; ++n)
    {
        for (int i = 0; i < MAXN; ++i)
        {
            d[i] += a[i] * b[i];
        }
    }
    clock_t start, end;
    start = clock();
    for (int n = 0; n < 20; ++n)
    {
        for (int i = 0; i < MAXN; i++)
        {
            c[i] += a[i] * b[i];
        }
    }
    end = clock();
    printf("time=%f\n", (double)(end - start) / CLOCKS_PER_SEC);
    for (int i = 0; i < MAXN; ++i)
    {
        if (fabs(c[i] - d[i]) / d[i] > 0.0001)
        {
            printf("Check Failed at %d\n", i);
            return 0;
        }
    }
    printf("Check Passed\n");
    for (int i = 0; i < MAXN; ++i)
    {
        a[i] = 1.0 / (rand() + 1);
        b[i] = 1.0 / (rand() + 1);
    }
    for (int n = 0; n < 20; ++n)
    {
        for (int i = 0; i < MAXN; ++i)
        {
            d[i] += a[i] * b[i];
        }
    }
    start = clock();
    for (int n = 0; n < 20; ++n)
    {
        __m256 vecA, vecB, vecC, tmp;
        for (int i = 0; i < MAXN; i += 8)
        {
            vecA = _mm256_loadu_ps(&a[i]);
            vecB = _mm256_loadu_ps(&b[i]);
            vecC = _mm256_loadu_ps(&c[i]);
            tmp = _mm256_mul_ps(vecA, vecB);
            vecC = _mm256_add_ps(vecC, tmp);
            _mm256_storeu_ps(&c[i], vecC);
        }
    }
    end = clock();
    printf("time=%f\n", (double)(end - start) / CLOCKS_PER_SEC);
    for (int i = 0; i < MAXN; ++i)
    {
        if (fabs(c[i] - d[i]) / d[i] > 0.0001)
        {
            printf("Check Failed at %d\n", i);
            return 0;
        }
    }
    printf("Check Passed\n");
    // for (int i = 0; i < MAXN; ++i)
    // {
    //     a[i] = 1.0 / (rand() + 1);
    //     b[i] = 1.0 / (rand() + 1);
    // }
    // for (int n = 0; n < 20; ++n)
    // {
    //     for (int i = 0; i < MAXN; ++i)
    //     {
    //         d[i] += a[i] * b[i];
    //     }
    // }
    // start = clock();
    // for (int n = 0; n < 20; ++n)
    // {
    //     __m512 vecA, vecB, vecC, tmp;
    //     for (int i = 0; i < MAXN; i += 16)
    //     {
    //         vecA = _mm512_loadu_ps(&a[i]);
    //         vecB = _mm512_loadu_ps(&b[i]);
    //         vecC = _mm512_loadu_ps(&c[i]);
    //         tmp = _mm512_mul_ps(vecA, vecB);
    //         vecC = _mm512_add_ps(vecC, tmp);
    //         _mm512_storeu_ps(&c[i], vecC);
    //     }
    // }
    // end = clock();
    // printf("time=%f\n", (double)(end - start) / CLOCKS_PER_SEC);
    // for (int i = 0; i < MAXN; ++i)
    // {
    //     if (fabs(c[i] - d[i]) / d[i] > 0.0001)
    //     {
    //         printf("Check Failed at %d\n", i);
    //         return 0;
    //     }
    // }
    // printf("Check Passed");
}