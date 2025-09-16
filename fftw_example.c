// fftw_example.c -  2D FFT Test for FFTW library
//
// Fred J. Frigo
// Marquette University
// 29-Jan-2025 
//
// Source code from : http://micro.stanford.edu/wiki/Install_FFTW3
//
//  gcc fftw_example.c -lm  -lfftw3 -o fftw_example 

 #include <stdio.h>
 #include <sys/time.h>   
 #include <fftw3.h>
 #include <math.h>
      
 int main(int argc, char **argv){

   const ptrdiff_t N0 = 1024, N1 = 1024;  /* 1024 x 1024 */
   struct timeval t1, t2;
   double elapsedTime;

   fftw_plan plan;
   fftw_complex *data;
 
   data = (fftw_complex *) fftw_malloc(sizeof(fftw_complex) * N0 * N1);
 
   /* create plan for forward DFT */
   plan = fftw_plan_dft_2d(N0, N1, data, data, FFTW_FORWARD, FFTW_ESTIMATE);
 
   /* initialize data to some function my_function(x,y) */
   int i, j;
   double pdata=0;
   for (i = 0; i < N0; ++i){
     for (j = 0; j < N1; ++j){
       data[i*N1 + j][0]=i; 
       data[i*N1 + j][1]=0;
       pdata+=data[i*N1 + j][0]*data[i*N1 + j][0]+data[i*N1 + j][1]*data[i*N1 + j][1];
     }
   }
   printf("power of original  data is %f\n", pdata);
 
   /* start timer */
   gettimeofday(&t1, NULL);

   /* compute transforms, in-place, as many times as desired */
   fftw_execute(plan);

   /* stop timer */
   gettimeofday(&t2, NULL);
 
   double normalization=sqrt((double)N0*N1);
   double ptransform = 0;
 
   /*normalize data and calculate power of transform */
   for (i = 0; i < N0; ++i){
     for (j = 0; j < N1; ++j){
       data[i*N1+j][0]/=normalization;
       data[i*N1+j][1]/=normalization;
       ptransform+=data[i*N1 + j][0]*data[i*N1 + j][0]+data[i*N1 + j][1]*data[i*N1 + j][1];
     }
   }
 
   printf("power of transform data is %f\n", ptransform);
  
   fftw_destroy_plan(plan);
   fftw_free(data); 

   /* print the FFT time in millisec */
   elapsedTime = (t2.tv_sec - t1.tv_sec) * 1000.0;      // sec to ms
   elapsedTime += (t2.tv_usec - t1.tv_usec) / 1000.0;   // us to ms
   printf("FFT Time: %f ms.\n", elapsedTime);

   return 0;
 }
