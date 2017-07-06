/*******************************************************************************
Vendor: Xilinx
Associated Filename: vadd.cpp
Purpose: SDAccel vector addition
Revision History: January 28, 2016

*******************************************************************************
Copyright (C) 2016 XILINX, Inc.

This file contains confidential and proprietary information of Xilinx, Inc. and
is protected under U.S. and international copyright and other intellectual
property laws.

DISCLAIMER
This disclaimer is not a license and does not grant any rights to the materials
distributed herewith. Except as otherwise provided in a valid license issued to
you by Xilinx, and to the maximum extent permitted by applicable law:
(1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX
HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR
FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether
in contract or tort, including negligence, or under any other theory of
liability) for any loss or damage of any kind or nature related to, arising under
or in connection with these materials, including for any direct, or any indirect,
special, incidental, or consequential loss or damage (including loss of data,
profits, goodwill, or any type of loss or damage suffered as a result of any
action brought by a third party) even if such damage or loss was reasonably
foreseeable or Xilinx had been advised of the possibility of the same.

CRITICAL APPLICATIONS
Xilinx products are not designed or intended to be fail-safe, or for use in any
application requiring fail-safe performance, such as life-support or safety
devices or systems, Class III medical devices, nuclear facilities, applications
related to the deployment of airbags, or any other applications that could lead
to death, personal injury, or severe property or environmental damage
(individually and collectively, "Critical Applications"). Customer assumes the
sole risk and liability of any use of Xilinx products in Critical Applications,
subject only to applicable laws and regulations governing limitations on product
liability.

THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT
ALL TIMES.

*******************************************************************************/
//OpenCL utility layer include
#include "xcl2.hpp"

#define LENGTH (1024)

int main(int argc, char* argv[])
{
    if(argc != 2) {
		std::cout << "Usage: " << argv[0] <<" <xclbin>" << std::endl;
		return EXIT_FAILURE;
	}

    char* xclbinFilename = argv[1];

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

    //Getting First Platform
    std::vector<cl::Platform> platforms;
    cl::Platform::get(&platforms);
    cl::Platform platform = platforms[0];
    std::cout << "Platform: " << platform.getInfo<CL_PLATFORM_NAME>() << "\n";

    //Getting ACCELERATOR Devices and selecting 1st such device
    std::vector<cl::Device> devices;
    platform.getDevices(CL_DEVICE_TYPE_ACCELERATOR, &devices);
    cl::Device device = devices[0];
    std::cout << "Device: " << device.getInfo<CL_DEVICE_NAME>() << "\n";

    //Creating Context and Command Queue for selected Device
    cl::Context context(device);
    cl::CommandQueue q(context, device);

    //Loading XCL Bin into char buffer
    std::cout << "Loading: '" << xclbinFilename << "'\n";
    std::ifstream bin_file(xclbinFilename, std::ifstream::binary);
    bin_file.seekg (0, bin_file.end);
    unsigned nb = bin_file.tellg();
    bin_file.seekg (0, bin_file.beg);
    char *buf = new char [nb];
    bin_file.read(buf, nb);

    // Creating Program from Binary File
    cl::Program::Binaries bins;
    bins.push_back({buf,nb});
    devices.resize(1);
    cl::Program program(context, devices, bins);

    //Creating Kernel and Functor of Kernel
    int err1;
    cl::Kernel kernel(program, "krnl_vadd", &err1);
     if (err1 != CL_SUCCESS)
     {
         std::cout << "Error: Failed to create compute kernel!" << std::endl;
         std::cout << "Test failed" << std::endl;
         return EXIT_FAILURE;
    }
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
