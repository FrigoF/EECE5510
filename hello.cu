// hello.cu 
// 
//  Fred J. Frigo
//  01-Sep-2020
//
//  See section B19.4:
//  https://docs.nvidia.com/cuda/archive/9.1/pdf/CUDA_C_Programming_Guide.pdf`
//
//  To compile:  nvcc hello.cu -o hello
//

#include <stdio.h>

__global__ void helloCUDA(float f)
{
   printf("Hello thread %d, f=%f\n", threadIdx.x, f);
}

int main()
{ 
   helloCUDA<<<1, 5>>>(1.2345f);
   cudaDeviceSynchronize();
   printf("Hello CUDA!\n"); 
   return 0;
}