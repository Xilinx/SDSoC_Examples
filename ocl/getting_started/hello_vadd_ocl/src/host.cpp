/**********
Copyright (c) 2018, Xilinx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**********/
/*******************************************************************************
 * Vendor: Xilinx
 * Associated Filename: vadd.cpp
 * Purpose: SDAccel vector addition
 * Revision History: January 28, 2016
*******************************************************************************/

//OpenCL utility layer include
#include "xcl2.hpp"

#define LENGTH (1024)

int main(int argc, char* argv[])
{
    size_t vector_size_bytes = sizeof(int) * LENGTH;
    //Source Memories
    std::vector<unsigned int> source_a(LENGTH);
    std::vector<unsigned int> source_b(LENGTH);
    std::vector<unsigned int> result_sim (LENGTH);
    std::vector<unsigned int> result_krnl(LENGTH);

    /* Create the test data and golden data locally */
    for(int i=0; i < LENGTH; i++){
        source_a[i] = i;
        source_b[i] = 2*i;
        result_sim[i] = source_a[i] + source_b[i];
    }

// OPENCL HOST CODE AREA START

    //Getting Xilinx Platform and its device
    std::vector<cl::Device> devices = xcl::get_xil_devices();
    cl::Device device = devices[0];
    std::string device_name = device.getInfo<CL_DEVICE_NAME>(); 

    //Creating Context and Command Queue for selected Device
    cl::Context context(device);
    cl::CommandQueue q(context, device);

    //Loading XCL Bin into char buffer
    std::string binaryFile = xcl::find_binary_file(device_name,"vadd");
    cl::Program::Binaries bins = xcl::import_binary_file(binaryFile);
    devices.resize(1);
    cl::Program program(context, devices, bins);

    //Creating Kernel and Functor of Kernel
    int err1;
    cl::Kernel kernel(program, "vadd", &err1);
    auto krnl_vadd = cl::KernelFunctor<cl::Buffer&, cl::Buffer&, cl::Buffer&, int>(kernel);

    //Creating Buffers inside Device
    cl::Buffer buffer_a(context, CL_MEM_READ_ONLY,  vector_size_bytes);
    cl::Buffer buffer_b(context, CL_MEM_READ_ONLY,  vector_size_bytes);
    cl::Buffer buffer_c(context, CL_MEM_WRITE_ONLY, vector_size_bytes);

    //Copying input data to Device buffer from host memory
    q.enqueueWriteBuffer(buffer_a, CL_TRUE, 0, vector_size_bytes, source_a.data());
    q.enqueueWriteBuffer(buffer_b, CL_TRUE, 0, vector_size_bytes, source_b.data());

    //Running Kernel
    krnl_vadd (cl::EnqueueArgs(q, cl::NDRange(1,1,1), cl::NDRange(1,1,1)),
                    buffer_a, buffer_b, buffer_c, LENGTH);

    q.finish();

    //Copying Device result data to Host memory
    q.enqueueReadBuffer(buffer_c, CL_TRUE, 0, vector_size_bytes, result_krnl.data());

// OPENCL HOST CODE AREA END

    /* Compare the results of the kernel to the simulation */
    bool krnl_match = true;
    for(int i = 0; i < LENGTH; i++){
        if(result_sim[i] != result_krnl[i]){
            std::cout <<"Error: Result mismatch" << std::endl;
            std::cout <<"i = " << i << " CPU result = " << result_sim[i] << " Krnl Result = " << result_krnl[i] << std::endl;
            krnl_match = false;
            break;
        }
    }
    std::cout << "TEST " << (krnl_match ? "PASSED" : "FAILED") << std::endl;
    return (krnl_match ? EXIT_SUCCESS: EXIT_FAILURE);
}
