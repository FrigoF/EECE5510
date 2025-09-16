// cuda_2d_fft.cu -  2D FFT Test for CUDA 
//
// Fred J. Frigo
// Marquette University
// 29-Jan-2025 
//
// See https://stackoverflow.com/questions/78967540/cuda-image-upsampling-with-fft-method
//
// To compile: nvcc -o cuda_2d_fft cuda_2d_fft.cu -lcufft 

#include <stdio.h>
#include <sys/time.h>   
#include <cufft.h>
#include <math.h>

typedef struct {
        float real;
        float imag;
} fcomplex;

int main(int argc, char **argv){

   int w = 1024, h = 1024;  // 2D FFT size is: (w x h )
   struct timeval t1, t2;
   double elapsedTime;
   fcomplex *data;

   //  initialize input data 
   data = (fcomplex *) malloc(sizeof(fcomplex) * w * h);
   int i, j;
   double pdata=0;
   for (i = 0; i < w; ++i){
     for (j = 0; j < h; ++j){
       data[i*w + j].real=(float)i;
       data[i*w + j].imag=(float)0;
       pdata+=data[i*w + j].real*data[i*w + j].real+data[i*w + j].imag*data[i*w + j].imag;
     }
   }
   // Show power of input signal to prove Parsevals Theorem
   printf("power of  input data is %f\n", pdata);

   // Input data buffer for device
   cufftComplex *d_i;
   cudaMalloc(&d_i, w*h*sizeof(cufftComplex));

   // copy input data to device 
   cudaMemcpy(d_i, data, w*h*sizeof(cufftComplex), cudaMemcpyHostToDevice);

   // create plan for 2D FFT
   cufftHandle hf;
   cufftResult r = cufftPlan2d(&hf, h, w, CUFFT_C2C); 
   
   // start timer 
   gettimeofday(&t1, NULL);

   // Perform Fourier Transform
   r = cufftExecC2C(hf, d_i, d_i, CUFFT_FORWARD);

   // stop timer 
   gettimeofday(&t2, NULL);

   // copy results from device to host 
   cudaMemcpy(data, d_i, w*h*sizeof(cufftComplex), cudaMemcpyDeviceToHost);

   // normalize results and calculate power of transform */
   double normalization=sqrt((double)w*h);
   double ptransform = 0;
   for (i = 0; i < w; ++i){
     for (j = 0; j < h; ++j){
       data[i*w+j].real/=normalization;
       data[i*w+j].imag/=normalization;
       ptransform+=data[i*w + j].real*data[i*w + j].real+data[i*w + j].imag*data[i*w + j].imag;
     }
   }
   printf("power of output data is %f\n", ptransform);
  
   free(data); 
   cudaFree(d_i);

   // print the FFT time in millisec 
   elapsedTime = (t2.tv_sec - t1.tv_sec) * 1000.0;      // sec to ms
   elapsedTime += (t2.tv_usec - t1.tv_usec) / 1000.0;   // us to ms
   printf("FFT Time: %f ms.\n", elapsedTime);

   return 0;
 }
