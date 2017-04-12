
#include "reference_calc.cpp"
#include "utils.h"

__global__
void gaussian_blur(const unsigned char* const inputChannel,
                   unsigned char* const outputChannel,
                   int numRows, int numCols,
                   const float* const filter, const int filterWidth)
{
    assert(filterWidth % 2 == 1);
  
    int r = blockIdx.y * blockDim.y + threadIdx.y;
    int c = blockIdx.x * blockDim.x + threadIdx.x;
    
    if ( r >= numRows || c >= numCols ) { 
        return;
    }
    
    float result = 0.f;
      for (int filter_r = -filterWidth/2; filter_r <= filterWidth/2; ++filter_r) {
        for (int filter_c = -filterWidth/2; filter_c <= filterWidth/2; ++filter_c) {
        
          int image_r = min(max(r + filter_r, 0), static_cast<int>(numRows - 1));
          int image_c = min(max(c + filter_c, 0), static_cast<int>(numCols - 1));

          float image_value = static_cast<float>(inputChannel[image_r * numCols + image_c]);
          float filter_value = filter[(filter_r + filterWidth/2) * filterWidth + filter_c + filterWidth/2];

          result += image_value * filter_value;
        }
      }

      outputChannel[r * numCols + c] = result;
  
}

//This kernel takes in an image represented as a uchar4 and splits
//it into three images consisting of only one color channel each
__global__
void separateChannels(const uchar4* const inputImageRGBA,
                      int numRows,
                      int numCols,
                      unsigned char* const redChannel,
                      unsigned char* const greenChannel,
                      unsigned char* const blueChannel)
{
  
  const int2 thread_2D_pos = make_int2( blockIdx.x * blockDim.x + threadIdx.x,
                                        blockIdx.y * blockDim.y + threadIdx.y);

  const int thread_1D_pos = thread_2D_pos.y * numCols + thread_2D_pos.x;
  
  if (thread_2D_pos.x >= numCols || thread_2D_pos.y >= numRows)
    return; 
    
  redChannel[thread_1D_pos] = inputImageRGBA[thread_1D_pos].x;
  greenChannel[thread_1D_pos] = inputImageRGBA[thread_1D_pos].y;
  blueChannel[thread_1D_pos] = inputImageRGBA[thread_1D_pos].z;
  
}

//This kernel takes in three color channels and recombines them
//into one image.  The alpha channel is set to 255 to represent
//that this image has no transparency.
__global__
void recombineChannels(const unsigned char* const redChannel,
                       const unsigned char* const greenChannel,
                       const unsigned char* const blueChannel,
                       uchar4* const outputImageRGBA,
                       int numRows,
                       int numCols)
{
  const int2 thread_2D_pos = make_int2( blockIdx.x * blockDim.x + threadIdx.x,
                                        blockIdx.y * blockDim.y + threadIdx.y);

  const int thread_1D_pos = thread_2D_pos.y * numCols + thread_2D_pos.x;
  
  if (thread_2D_pos.x >= numCols || thread_2D_pos.y >= numRows)
    return;

  unsigned char red   = redChannel[thread_1D_pos];
  unsigned char green = greenChannel[thread_1D_pos];
  unsigned char blue  = blueChannel[thread_1D_pos];

  uchar4 outputPixel = make_uchar4(red, green, blue, 255);

  outputImageRGBA[thread_1D_pos] = outputPixel;
}

unsigned char *d_red, *d_green, *d_blue;
float         *d_filter;

void allocateMemoryAndCopyToGPU(const size_t numRowsImage, const size_t numColsImage,
                                const float* const h_filter, const size_t filterWidth)
{
  checkCudaErrors(cudaMalloc(&d_red,   sizeof(unsigned char) * numRowsImage * numColsImage));
  checkCudaErrors(cudaMalloc(&d_green, sizeof(unsigned char) * numRowsImage * numColsImage));
  checkCudaErrors(cudaMalloc(&d_blue,  sizeof(unsigned char) * numRowsImage * numColsImage));

  
  checkCudaErrors(cudaMalloc(&d_filter, sizeof(float) * numRowsImage * numColsImage));
  
  checkCudaErrors(cudaMemcpy(d_filter,h_filter, sizeof(float)*numRowsImage*numColsImage, cudaMemcpyHostToDevice));

}

void your_gaussian_blur(const uchar4 * const h_inputImageRGBA, uchar4 * const d_inputImageRGBA,
                        uchar4* const d_outputImageRGBA, const size_t numRows, const size_t numCols,
                        unsigned char *d_redBlurred, 
                        unsigned char *d_greenBlurred, 
                        unsigned char *d_blueBlurred,
                        const int filterWidth)
{
  const dim3 blockSize(32,32,1);
  const dim3 gridSize(numCols/16, numRows/16, 1);


  separateChannels<<<gridSize, blockSize>>>(d_inputImageRGBA,numRows,numCols,d_red,d_green,d_blue);
  
  cudaDeviceSynchronize(); checkCudaErrors(cudaGetLastError());

  gaussian_blur<<<gridSize, blockSize>>>(d_red,d_redBlurred,numRows,numCols,d_filter,filterWidth);
  gaussian_blur<<<gridSize, blockSize>>>(d_green,d_greenBlurred,numRows,numCols,d_filter,filterWidth);
  gaussian_blur<<<gridSize, blockSize>>>(d_blue,d_blueBlurred,numRows,numCols,d_filter,filterWidth);
  
  cudaDeviceSynchronize(); checkCudaErrors(cudaGetLastError());
  
  recombineChannels<<<gridSize, blockSize>>>(d_redBlurred,d_greenBlurred,d_blueBlurred,d_outputImageRGBA,numRows,numCols);
  
  cudaDeviceSynchronize(); checkCudaErrors(cudaGetLastError());
}


//Free all the memory that we allocated
//TODO: make sure you free any arrays that you allocated
void cleanup() {
  checkCudaErrors(cudaFree(d_red));
  checkCudaErrors(cudaFree(d_green));
  checkCudaErrors(cudaFree(d_blue));
}
