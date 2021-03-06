/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform_config.h"
#include "xtime_l.h"
//#include "xconvolve_tensors.h"
#include "activation_functions.hpp"
#include "net_parser.hpp"
#include <stdlib.h>

#include "xparameters.h"	/* SDK generated parameters */
#include "xsdps.h"		/* SD device driver */
#include "xil_printf.h"
#include "ff.h"
#include "xil_cache.h"
#include "xplatform_info.h"

typedef module network;

/*
	GRANDE = vga sized image
	KITTI  = prettu much the same number of pixels you can find in a KITTI disparity map
	  /    = 32x32 1024 pixels total

	SIZE is their size in bytes
*/

#define GRANDE
//#define KITTI

#ifdef GRANDE
#define INPUT_SIZE 6192607
#else
	#ifdef KITTI
	#define INPUT_SIZE 9660463
	#else
	#define INPUT_SIZE 20647
	#endif
#endif


//#define SYNTH_NET


FATFS     FatFs;         
FIL       input;             
FIL 	  net;

/*
	There could be problems if you use long filenames, so please keep it short
*/

#ifdef GRANDE
static char FileNameIn[32] = "finale";
#else
	#ifdef KITTI
	static char FileNameIn[32] = "kitti";
	#else
	static char FileNameIn[32] = "input";
	#endif
#endif

static char *SD_File_In;
static char *SD_File_Net;

/*
	net.xml is the simpler one, while bla.xml is CCCN
*/

#ifdef SYNTH_NET
static char FileNameNet[32] = "net.xml";
#define NET_SIZE 121108
#else
static char FileNameNet[32] = "bla.xml";
#define NET_SIZE 2329354
#endif



#ifdef __ICCARM__
#pragma data_alignment = 32
u8 Input_addr[INPUT_START_ADDR];
u8 Net_addr[NET_START_ADDR];
#pragma data_alignment = 4
#else
//u8 Input_addr[INPUT_START_ADDR] __attribute__ ((aligned(32)));
//u8 Net_addr[NET_START_ADDR] __attribute__ ((aligned(32)));
#endif

//extern void *__mem1_start;

int load_files_from_sdcard(FILE **in_f, FILE **to_parse){


    FRESULT   rc;               // Return code

    UINT input_size = INPUT_SIZE;
    UINT net_size   = NET_SIZE;

    UINT * in_read_bytes  = 0U;
    UINT * net_read_bytes = 0U;

	TCHAR *Path = "0:/";

    printf("Mounting SD Card...\n");

    /* Register work area to the default drive */
    if ((rc = f_mount(&FatFs,Path,1)) != FR_OK) {
        xil_printf("main(): f_mount(0:) failed with return code %d!\r\n",rc);
        return(-1);
    }

    /* Open a file */
    printf("Opening %s...\n", FileNameIn);
	SD_File_In = (char *)FileNameIn;

    if ((rc = f_open(&input,SD_File_In,FA_OPEN_EXISTING | FA_READ)) != FR_OK) {    // <<<<<<<< Fails!!!
        xil_printf("main(): f_open() failed with return code %d!\r\n",rc);
        return(-1);
    }

    /* Open a file */
    printf("Opening %s...\n", FileNameNet);
	SD_File_Net = (char *)FileNameNet;

    if ((rc = f_open(&net,SD_File_Net,FA_OPEN_EXISTING | FA_READ)) != FR_OK) {    // <<<<<<<< Fails!!!
        xil_printf("main(): f_open() failed with return code %d!\r\n",rc);
        return(-1);
    }

    //Copying files from sd card to RAM
    printf("Seek on %s...\n", FileNameIn);

    rc = f_lseek(&input, 0);
	if (rc) {
		return XST_FAILURE;
	}

	printf("Seek on %s...\n", FileNameNet);

	rc = f_lseek(&net, 0);
	if (rc) {
		return XST_FAILURE;
	}

	//We'll write to those 2 mem areas
	unsigned char input_mem[INPUT_SIZE];
	unsigned char net_mem[NET_SIZE];

    printf("Reading %s...\n", FileNameIn);
	rc = f_read(&input,(void*) input_mem, input_size, in_read_bytes);
	if (rc) {
		return XST_FAILURE;
	}

    printf("Reading %s...\n", FileNameNet);
	rc = f_read(&net, (void*)net_mem, net_size, net_read_bytes);
	if (rc) {
		return XST_FAILURE;
	}

	printf("Input size: %u Net size: %u\n",input_size,net_size);
	printf("Ho letto %u B da input e %u B da net.xml\n",*in_read_bytes,*net_read_bytes);

    printf("Trying fmemopen...\n");
	*in_f = fmemopen((void *) input_mem, input_size, "r");
	*to_parse = fmemopen((void *) net_mem, net_size, "r");
/*
    printf("Closing %s...\n", FileNameIn);
    rc = f_close(&input);
    if (rc) {
        xil_printf(" ERROR : f_close returned %d\r\n", rc);
        return XST_FAILURE;
    }

    printf("Closing %s...\n", FileNameNet);
    rc = f_close(&net);
    if (rc) {
        xil_printf(" ERROR : f_close returned %d\r\n", rc);
        return XST_FAILURE;
    }
*/

    printf("Umounting SD Card...\n");

    /* Register work area to the default drive */
    if ((rc = f_mount(NULL,Path,1)) != FR_OK) {
        xil_printf("main(): f_mount(0:) failed with return code %d!\r\n",rc);
        return(-1);
    }

    return 0;
}



void test_system_5() // test parser
{
	//char * SHARED_DRAM;

//	time_t start, end;

//	time(&start);


	FILE *to_parse = NULL;
	FILE *in_f = NULL;

	//printf("INDIRIZZI PRIMA to_parse e in_F: %p e %p \n", to_parse, in_f);

	load_files_from_sdcard(&in_f, &to_parse);

	//printf("INDIRIZZI DOPO to_parse e in_F: %p e %p \n", to_parse, in_f);

	if(!to_parse)
	{
		fprintf(stderr, "ERROR: Can't open net file. Exiting...\n");
		exit(-1);
	}

	if(!in_f)
	{
		perror("in_f");
		exit(-1);
	}

	fseek(in_f, 0L, SEEK_END);
	int size = ftell(in_f);
	rewind(in_f);

	//printf("IL FILE DI INPUT E' GRANDE: %d\n",size);

	int in_len, fscanf_ret_val;
	char *in_str =(char *) malloc(size+1);
	tensor_data_t *in_data;

	fscanf_ret_val = fscanf(in_f, "%d\n", &in_len);
	//fscanf_ret_val = fscanf(in_f, "%m[^\n]\n", &in_str);

	  if (in_str)
	  {
	    fread(in_str, 1, size, in_f);
	  }
	in_str[size] = '\0';


	fclose(in_f);

	printf("Parsing tensor data...\n");

	//printf("DIMENSIONE INPUT: %d \n", in_len);
	//printf("STRINGONA INPUT: %s \n", in_str);

	in_data = parse_tensor_data((const char *)in_str, in_len);
	free(in_str);

	tensor input;

	input.d = 1;
#ifdef GRANDE
	input.h = 480;
	input.w = 640;
#else
	#ifdef KITTI
		input.h = 468;
		input.w = 1024;
		//non è il rapporto di kitti ma il numero di pixel è quello
	#else
		input.h = 32;
		input.w = 32;
	#endif
#endif
	input.data = in_data;


	printf("Parsing network...\n");

//	tensor padded_input = pad_tensor(input, 4, 4);
//	free_tensor(&input);

	network net = parse_network(to_parse);
//	set_input(&padded_input, &net);
	set_input(&input, &net);
    XTime tStart, tEnd;



    // XConvolve_tensors_Start(&InstancePtr);
    Xil_DCacheFlush();
    XTime_GetTime(&tStart);
	printf("\n---- Forwarding NETWORK ----\n\n");
	forward(&net);
    XTime_GetTime(&tEnd);
    printf("TEMPO TOTALE:\n");
    Xil_DCacheFlush();

    printf("Output took %llu clock cycles.\n", 2*(tEnd - tStart));
    printf("Output took %.2f us.\n",
           1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND/1000000));
//	time(&end);

//	double diff = difftime(end, start);
//	printf("[SYSTEM] EXECUTION TIME: %lf minutes\n", (diff/60.));

   // print_tensor(net.modules[13].output);

	print_module(net, 0);

	free_module(&net);
}


int main()
{
   // init_platform();

    test_system_5();

   // cleanup_platform();
    return 0;
}
