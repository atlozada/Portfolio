// Homework 1
// Color to Greyscale Conversion

#include "reference_calc.cpp"
#include "utils.h"
#include <stdio.h>

__global__
void rgba_to_greyscale(const uchar4* const rgbaImage,
                       unsigned char* const greyImage,
                       int numRows, int numCols)
{
  
  size_t idx = (blockIdx.x * blockDim.x) + threadIdx.x;
  size_t idy = (blockIdx.y * blockDim.y) + threadIdx.y;
  
  uchar4 rgba = rgbaImage[idx * numRows + idy];
  float channelSum = .299f * rgba.x + .587f * rgba.y + .114f * rgba.z;
  greyImage[idx * numRows + idy] = channelSum;
}

void your_rgba_to_greyscale(const uchar4 * const h_rgbaImage, uchar4 * const d_rgbaImage,
                            unsigned char* const d_greyImage, size_t numRows, size_t numCols)
{
  const dim3 blockSize(17, 17, 1);  //TODO
  const dim3 gridSize(numCols/16, numRows/16, 1);  //TODO
  rgba_to_greyscale<<<gridSize, blockSize>>>(d_rgbaImage, d_greyImage, numRows, numCols);
  
  cudaDeviceSynchronize(); checkCudaErrors(cudaGetLastError());
}