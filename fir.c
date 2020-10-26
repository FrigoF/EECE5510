// fir.c - FIR Filter example
//
// Fig 8.43 - Blandford p.468
//
// 
// Fred J. Frigo @MarquetteU
// 25-Oct_2020
//
// To compile: $ gcc fir.c -o fir

#include <stdio.h>
#include <math.h>

// FIR filter coefficients for 12th order symmetric filter (type 1) 
const float b[] = {-0.00725966, 0.04014696, 0.02354041, 
                   -0.08357119, -0.02859982, 0.31030209,
                    0.53138928, 0.31030209, -0.02859982,
                   -0.08357119, 0.02354041, 0.04014696, -0.00725966};

// Use impulse response as input

const float x[] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                    1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

int main()
{
    int i, j;
    float y;

    // Number of FIR filter coefficients
    int M = sizeof(b)/sizeof(float);

    // Number of inputs
    int N = sizeof(x)/sizeof(float);

    // Determine number of outputs:  M-N+1
    int K = N-M+1;
    for( j=0; j< K; j++)
    {
       y=0.0;
       for(i=0; i < M; i++)
       {
          y = (float)((b[i]*x[i+j]) + y);  // FIR filter
       }    
       printf("%.5f\n", y); // Print output  
    }
}
