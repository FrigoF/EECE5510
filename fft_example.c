// fft_example.c -  2D FFT Test for FFT benchmark 
//
// Fred J. Frigo
// Marquette University
// 29-Jan-2025
//
//  gcc fft_example.c -lm  -o fft_example 

 #include <stdio.h>
 #include <stdlib.h>
 #include <sys/time.h>   
 #include <math.h>

 typedef struct {
        float real;
        float imag;
        } fcomplex;

 static float fftwt_c[] = {0.0,
    -1.000000e+00,
    0.0,
    7.071068e-01,
    9.238795e-01,
    9.807853e-01,
    9.951847e-01,
    9.987954e-01,
    9.996988e-01,
    9.999247e-01,
    9.999812e-01,
    9.999953e-01,
    9.999988e-01  
    };

 static float fftwt_s[] = {0.0,
    0.0,
    -1.000000e+00,
    -7.071068e-01,
    -3.826834e-01,
    -1.950903e-01,
    -9.801714e-02,
    -4.906768e-02,
    -2.454123e-02,
    -1.227154e-02,
    -6.135885e-03,
    -3.067957e-03,
    -1.533980e-03};

/* ------------------------------------------------------------------ */
/*                    cfft function                                   */
/* ------------------------------------------------------------------ */

 void cfft(fcomplex *a, int complex_element_cnt, int iopt) /* iopt = 1=forward -1=inverse */ 
 {
    int    m = 0;
    int    i, j, k, l, n, nv2, nm1;
    int    le, le1, ip;

    float  fn, ta, tb, tmp;
    float  ua, ub, wa, wb;

    int x_n = complex_element_cnt,x_m=0;
    while(x_n >>= 1) x_m++;
    complex_element_cnt=x_m;

    m = complex_element_cnt;
    n = 1 << m;

    fn = 1.0;

    if (iopt == -1)
    {
	for (i = 0; i < n; i++)
	{
	    a[i].real *= fn;
	    a[i].imag *= -fn;
	}
    }

    nv2 = n >> 1;
    nm1 = n - 1;
    j = 0;

    for (i = 0; i < nm1; i++)
    {
	if (i < j)
	{
	    ta = a[j].real;
	    tb = a[j].imag;
	    a[j].real = a[i].real;
	    a[j].imag = a[i].imag;
	    a[i].real = ta;
	    a[i].imag = tb;
	}
	k = nv2;
	while (k <= j)
	{
	    j -= k;
	    k = k >> 1;
	}
	j += k;
    }

    for (l = 1; l <= m; l++)
    {
	le = 1 << l;
	le1 = le >> 1;
	ua = 1.0;
	ub = 0.0;
	wa = fftwt_c[l];
	wb = fftwt_s[l];

	for (j = 0; j < le1; j++)
	{
	    for (i = j; i < n; i += le)
	    {
		ip = i + le1;
		ta = a[ip].real * ua - a[ip].imag * ub;
		tb = a[ip].real * ub + a[ip].imag * ua;
		a[ip].real = a[i].real - ta;
		a[ip].imag = a[i].imag - tb;
		a[i].real = a[i].real + ta;
		a[i].imag = a[i].imag + tb;
	    }
	    tmp = ua;
	    ua = ua * wa - ub * wb;
	    ub = tmp * wb + ub * wa;
	}

    }
    if (iopt == -1)
    {
	for (i = 0; i < n; i++)
	    a[i].imag = -a[i].imag;
    }
 }

      
/* ------------------------------------------------------------------ */
/*                    main                                            */
/* ------------------------------------------------------------------ */

 int main(int argc, char **argv){

   const int  N0 = 1024, N1 = 1024;  /* 1024 x 1024 */
   struct timeval t1, t2;
   double elapsedTime;
   fcomplex *data;
   fcomplex *output;

   data   = (fcomplex *) malloc(sizeof(fcomplex) * N0 * N1);
   output = (fcomplex *) malloc(sizeof(fcomplex) * N0 * N1);
 
   /* initialize data to some function my_function(x,y) */
   int i, j;
   double pdata=0;
   for (i = 0; i < N0; ++i){
     for (j = 0; j < N1; ++j){
       data[i*N1 + j].real=(float)i; 
       data[i*N1 + j].imag=(float)0;
       pdata+=data[i*N1 + j].real*data[i*N1 + j].real+data[i*N1 + j].imag*data[i*N1 + j].imag;
     }
   }
   printf("power of original  data is %f\n", pdata);
 
   /* start timer */
   gettimeofday(&t1, NULL);

   /* compute row transforms in-place */
   for (i=0; i < N0; ++i){
     cfft( &data[i*N1], N1, 1 );
   }

   /* Matrix Transpose */
   for (i = 0; i < N0; ++i){
      for (j = 0; j < N1; ++j){
       output[j*N1 + i]=data[i*N1 +j];
      }
   }

   /* compute column transforms in-place */
   for (i=0; i < N1; ++i){
     cfft( &data[i*N0], N0, 1 );
   }

   /* stop timer */
   gettimeofday(&t2, NULL);
 
   double normalization=sqrt((double)N1*(double)N2);
   double ptransform = 0;
 
   /*normalize data and calculate power of transform */
   for (i = 0; i < N0; ++i){
     for (j = 0; j < N1; ++j){
       data[i*N1+j].real/=normalization;
       data[i*N1+j].imag/=normalization;
       ptransform+=data[i*N1 + j].real*data[i*N1 + j].real+data[i*N1 + j].imag*data[i*N1 + j].imag;
     }
   }
 
   printf("power of transform data is %f\n", ptransform);
  
   free(data); 

   /* print the FFT time in millisec */
   elapsedTime = (t2.tv_sec - t1.tv_sec) * 1000.0;      // sec to ms
   elapsedTime += (t2.tv_usec - t1.tv_usec) / 1000.0;   // us to ms
   printf("FFT Time: %f ms.\n", elapsedTime);

   return 0;
 }
