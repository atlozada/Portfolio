#include "utils.h"

__global__ void getHistogram(   unsigned int * d_bins,
                                unsigned int* const d_inputVals,
                                unsigned int iteration,
                                const int numElems) {

    __shared__ unsigned int* bins;
    __shared__ unsigned int* inputVals;

    int idx = threadIdx.x + blockDim.x * blockIdx.x;

    if(idx >= numElems) {
        return;
    }

    bins = d_bins;
    inputVals = d_inputVals;
    int bin;

    if ((inputVals[idx] & (1<<iteration)) == (1<<iteration)) {
        bin = 1;
    } else {
        bin = 0;
    }

    if (bin == 1) {
         atomicAdd(&bins[1], 1);
    } else {
         atomicAdd(&bins[0], 1);
    }

    if (idx == 1) {
        d_bins = bins;
    }

}

__global__ void prefixScan( unsigned int * d_inputVals,
                            unsigned int * d_binScan,
                            unsigned int blockSize,
                            const int numElems,
                            unsigned int outerIteration,
                            unsigned int innerIteration) {

    __shared__ unsigned int* inputVals;
    __shared__ unsigned int* binScan;

    int idx = threadIdx.x + blockSize * innerIteration;

    if(idx >= numElems) {
        return;
    }

    unsigned int sum = 0;
    inputVals = d_inputVals;
    binScan = d_binScan;

    if (idx > 0 && (inputVals[idx-1] & (1<<outerIteration))  == (1<<outerIteration)) {
        sum = 1;
    }

    binScan[idx] = sum;

    __syncthreads();

    for(int n = 1; n <= blockSize; n *= 2) {
        int prefix = idx - n;

        if (prefix >= 0 && prefix >= blockSize*innerIteration) {
            sum = binScan[prefix];
        }

        __syncthreads();

        if (prefix >= 0 && prefix >= blockSize*innerIteration) {
            binScan[idx] += sum;
        }
        __syncthreads();
    }

    if(innerIteration > 0) {
        binScan[idx] += binScan[innerIteration*blockSize - 1];
    }

    __syncthreads();

    if (idx == 1) {
        d_binScan = binScan;
    }
}

__global__ void calcOffset( unsigned int* const d_inputVals,
                            unsigned int* const d_inputPos,
                            unsigned int* const d_binScan,
                            unsigned int* d_outputVals,
                            unsigned int* d_outputPos,
                            unsigned int* d_offsetPos,
                            unsigned int numOnes,
                            const size_t numElems,
                            unsigned int iteration) {

    __shared__ unsigned int* inputVals;
    __shared__ unsigned int* inputPos;
    __shared__ unsigned int* outputVals;
    __shared__ unsigned int* outputPos;
    __shared__ unsigned int* offsetPos;
    __shared__ unsigned int* binScan;

    int idx = threadIdx.x + blockDim.x * blockIdx.x;

    if(idx >= numElems) {
        return;
    }

    inputVals = d_inputVals;
    inputPos = d_inputPos;
    outputVals = d_outputVals;
    outputPos = d_outputPos;
    offsetPos = d_offsetPos;
    binScan = d_binScan;

    unsigned int offsetSum;
    unsigned int baseOffset;

    if( ( inputVals[idx] & (1<<iteration)) == (1<<iteration)) {
        offsetSum = binScan[idx];
        baseOffset = numOnes;
    } else {
        offsetSum = (idx) - binScan[idx];
        baseOffset = 0;
    }

    offsetPos[idx] = baseOffset+offsetSum;
    outputPos[baseOffset+offsetSum]  = inputPos[idx];
    outputVals[baseOffset+offsetSum] = inputVals[idx];

    if (idx == 1) {
        d_offsetPos = offsetPos;
        d_outputVals = outputVals;
        d_outputPos = outputPos;
    }
}

void your_sort(unsigned int* const d_inputVals,
               unsigned int* const d_inputPos,
               unsigned int* const d_outputVals,
               unsigned int* const d_outputPos,
               const size_t numElems) {

    unsigned int* d_histogramBins;
    unsigned int  h_histogramBins[2];
    unsigned int* d_binScan;
    unsigned int* d_offsetPos;

    checkCudaErrors(cudaMalloc(&d_histogramBins, sizeof(int)*2));
    checkCudaErrors(cudaMalloc(&d_binScan, sizeof(int)*numElems));
    checkCudaErrors(cudaMalloc(&d_offsetPos, sizeof(int)*numElems));


    dim3 blocksize(1024);
    dim3 gridsize(numElems/1024+1);


    for(unsigned int i = 0; i < 32; i++) {

        checkCudaErrors(cudaMemset(d_histogramBins, 0, sizeof(int)*2));
        checkCudaErrors(cudaMemset(d_binScan, 0, sizeof(int)*numElems));
        checkCudaErrors(cudaMemset(d_outputVals, 0, sizeof(int)*numElems));
        checkCudaErrors(cudaMemset(d_outputPos, 0, sizeof(int)*numElems));

        getHistogram<<<blocksize, gridsize>>>(d_histogramBins, d_inputVals, i, numElems);

        cudaDeviceSynchronize(); checkCudaErrors(cudaGetLastError());
        checkCudaErrors(cudaMemcpy(&h_histogramBins, d_histogramBins, sizeof(int)*2, cudaMemcpyDeviceToHost));


        for(int j = 0; j < gridsize.x; j++) {
            prefixScan<<<dim3(1), blocksize>>>(d_inputVals, d_binScan, blocksize.x, numElems, i, j);
            cudaDeviceSynchronize(); checkCudaErrors(cudaGetLastError());
        }

        calcOffset<<<gridsize, blocksize>>>(d_inputVals, d_inputPos, d_binScan, d_outputVals, d_outputPos, d_offsetPos, h_histogramBins[0], numElems, i);

        cudaDeviceSynchronize(); checkCudaErrors(cudaGetLastError());
        checkCudaErrors(cudaMemcpy(d_inputVals, d_outputVals, sizeof(int)*numElems, cudaMemcpyDeviceToDevice));
        checkCudaErrors(cudaMemcpy(d_inputPos, d_outputPos, sizeof(int)*numElems, cudaMemcpyDeviceToDevice));
        cudaDeviceSynchronize(); checkCudaErrors(cudaGetLastError());
    }
}
