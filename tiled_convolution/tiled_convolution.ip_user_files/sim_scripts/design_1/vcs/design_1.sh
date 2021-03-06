#!/bin/bash -f
#*********************************************************************************************************
# Vivado (TM) v2017.3 (64-bit)
#
# Filename    : design_1.sh
# Simulator   : Synopsys Verilog Compiler Simulator
# Description : Simulation script for compiling, elaborating and verifying the project source files.
#               The script will automatically create the design libraries sub-directories in the run
#               directory, add the library logical mappings in the simulator setup file, create default
#               'do/prj' file, execute compilation, elaboration and simulation steps.
#
# Generated by Vivado on Thu Nov 16 14:24:20 CET 2017
# SW Build 2018833 on Wed Oct  4 19:58:07 MDT 2017
#
# Copyright 1986-2017 Xilinx, Inc. All Rights Reserved. 
#
# usage: design_1.sh [-help]
# usage: design_1.sh [-lib_map_path]
# usage: design_1.sh [-noclean_files]
# usage: design_1.sh [-reset_run]
#
# Prerequisite:- To compile and run simulation, you must compile the Xilinx simulation libraries using the
# 'compile_simlib' TCL command. For more information about this command, run 'compile_simlib -help' in the
# Vivado Tcl Shell. Once the libraries have been compiled successfully, specify the -lib_map_path switch
# that points to these libraries and rerun export_simulation. For more information about this switch please
# type 'export_simulation -help' in the Tcl shell.
#
# You can also point to the simulation libraries by either replacing the <SPECIFY_COMPILED_LIB_PATH> in this
# script with the compiled library directory path or specify this path with the '-lib_map_path' switch when
# executing this script. Please type 'design_1.sh -help' for more information.
#
# Additional references - 'Xilinx Vivado Design Suite User Guide:Logic simulation (UG900)'
#
#*********************************************************************************************************

# Directory path for design sources and include directories (if any) wrt this path
ref_dir="."

# Override directory with 'export_sim_ref_dir' env path value if set in the shell
if [[ (! -z "$export_sim_ref_dir") && ($export_sim_ref_dir != "") ]]; then
  ref_dir="$export_sim_ref_dir"
fi

# Command line options
vlogan_opts="-full64"
vhdlan_opts="-full64"
vcs_elab_opts="-full64 -debug_pp -t ps -licqueue -l elaborate.log"
vcs_sim_opts="-ucli -licqueue -l simulate.log"

# Design libraries
design_libs=(xil_defaultlib xpm xbip_utils_v3_0_8 axi_utils_v2_0_4 xbip_pipe_v3_0_4 xbip_dsp48_wrapper_v3_0_4 xbip_dsp48_addsub_v3_0_4 xbip_dsp48_multadd_v3_0_4 xbip_bram18k_v3_0_4 mult_gen_v12_0_13 floating_point_v7_1_5 axi_infrastructure_v1_1_0 smartconnect_v1_0 axi_protocol_checker_v2_0_0 axi_vip_v1_1_0 processing_system7_vip_v1_0_2 lib_cdc_v1_0_2 proc_sys_reset_v5_0_12 generic_baseblocks_v2_1_0 fifo_generator_v13_2_0 axi_data_fifo_v2_1_13 axi_register_slice_v2_1_14 axi_protocol_converter_v2_1_14 axi_clock_converter_v2_1_13 blk_mem_gen_v8_4_0 axi_dwidth_converter_v2_1_14)

# Simulation root library directory
sim_lib_dir="vcs_lib"

# Script info
echo -e "design_1.sh - Script generated by export_simulation (Vivado v2017.3 (64-bit)-id)\n"

# Main steps
run()
{
  check_args $# $1
  setup $1 $2
  compile
  elaborate
  simulate
}

# RUN_STEP: <compile>
compile()
{
  # Compile design files
  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "/media/dati/dante/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
    "/media/dati/dante/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
    "/media/dati/dante/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xpm $vhdlan_opts \
    "/media/dati/dante/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_VCOMP.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xbip_utils_v3_0_8 $vhdlan_opts \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/4173/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_utils_v2_0_4 $vhdlan_opts \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/4575/hdl/axi_utils_v2_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xbip_pipe_v3_0_4 $vhdlan_opts \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ee5e/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xbip_dsp48_wrapper_v3_0_4 $vhdlan_opts \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/da55/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xbip_dsp48_addsub_v3_0_4 $vhdlan_opts \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/7b8d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xbip_dsp48_multadd_v3_0_4 $vhdlan_opts \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/65ba/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xbip_bram18k_v3_0_4 $vhdlan_opts \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/9eb4/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work mult_gen_v12_0_13 $vhdlan_opts \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/257f/hdl/mult_gen_v12_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work floating_point_v7_1_5 $vhdlan_opts \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/b20f/hdl/floating_point_v7_1_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/aesl_mux_load_28_35_s.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/convolve4.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_in_channbIp.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_in_channbIp_memcore.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_in_channels.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_in_channmb6.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_in_channmb6_memcore.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_out_chanbNq.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_out_chanbNq_memcore.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_out_channel.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/dataflow_out_channel_1.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/fifo_w16_d1_A.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/fifo_w16_d1_A_x.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/fifo_w30_d1_A.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/fifo_w32_d1_A.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/fifo_w32_d1_A_x.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/read_in_wh81.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/read_input.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/read_weights.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/set_out_buffer_to_0.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/write_output.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_biasbuf_V.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_control_s_axi.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_fpext_3bkb.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_gmem_m_axi.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mac_muldEe.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mac_mulfYi.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mac_muljbC.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mac_mulkbM.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mul_16ng8j.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mul_16nhbi.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mul_mulcud.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mul_muleOg.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mul_mulibs.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_mul_mullbW.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_partialcfu.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_sitofp_bMq.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_srem_17bLp.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_srem_17cHz.v" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/verilog/zhang_cnn_srem_17cIz.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/ip/zhang_cnn_ap_fpext_0_no_dsp_32.vhd" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/228f/hdl/ip/zhang_cnn_ap_sitofp_4_no_dsp_64.vhd" \
    "$ref_dir/../../../bd/design_1/ip/design_1_zhang_cnn_0_0/sim/design_1_zhang_cnn_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work axi_infrastructure_v1_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/sc_util_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_protocol_checker_v2_0_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5c1/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_vip_v1_1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/8b42/hdl/axi_vip_v1_1_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work processing_system7_vip_v1_0_2 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work lib_cdc_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work proc_sys_reset_v5_0_12 $vhdlan_opts \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_rst_processing_system7_0_100M_0/sim/design_1_rst_processing_system7_0_100M_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/sim/design_1.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work generic_baseblocks_v2_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work fifo_generator_v13_2_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/0798/simulation/fifo_generator_vlog_beh.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work fifo_generator_v13_2_0 $vhdlan_opts \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/0798/hdl/fifo_generator_v13_2_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work fifo_generator_v13_2_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/0798/hdl/fifo_generator_v13_2_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_data_fifo_v2_1_13 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/74ae/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_register_slice_v2_1_14 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/a259/hdl/axi_register_slice_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_protocol_converter_v2_1_14 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/33cc/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_auto_pc_1/sim/design_1_auto_pc_1.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_clock_converter_v2_1_13 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/7d05/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work blk_mem_gen_v8_4_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e50b/simulation/blk_mem_gen_v8_4.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_dwidth_converter_v2_1_14 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d498/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/d5d3/hdl/verilog" +incdir+"$ref_dir/../../../../tiled_convolution.srcs/sources_1/bd/design_1/ipshared/e0a2/hdl" +incdir+"/media/dati/dante/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_auto_us_0/sim/design_1_auto_us_0.v" \
  2>&1 | tee -a vlogan.log


  vlogan -work xil_defaultlib $vlogan_opts +v2k \
    glbl.v \
  2>&1 | tee -a vlogan.log

}

# RUN_STEP: <elaborate>
elaborate()
{
  vcs $vcs_elab_opts xil_defaultlib.design_1 xil_defaultlib.glbl -o design_1_simv
}

# RUN_STEP: <simulate>
simulate()
{
  ./design_1_simv $vcs_sim_opts -do simulate.do
}

# STEP: setup
setup()
{
  case $1 in
    "-lib_map_path" )
      if [[ ($2 == "") ]]; then
        echo -e "ERROR: Simulation library directory path not specified (type \"./design_1.sh -help\" for more information)\n"
        exit 1
      fi
      create_lib_mappings $2
    ;;
    "-reset_run" )
      reset_run
      echo -e "INFO: Simulation run files deleted.\n"
      exit 0
    ;;
    "-noclean_files" )
      # do not remove previous data
    ;;
    * )
      create_lib_mappings $2
  esac

  create_lib_dir

  # Add any setup/initialization commands here:-

  # <user specific commands>

}

# Define design library mappings
create_lib_mappings()
{
  file="synopsys_sim.setup"
  if [[ -e $file ]]; then
    if [[ ($1 == "") ]]; then
      return
    else
      rm -rf $file
    fi
  fi

  touch $file

  if [[ ($1 != "") ]]; then
    lib_map_path="$1"
  else
    lib_map_path="/home/studio/VIVADO_2017/tiled_convolution/tiled_convolution.cache/compile_simlib/vcs"
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    mapping="$lib:$sim_lib_dir/$lib"
    echo $mapping >> $file
  done

  if [[ ($lib_map_path != "") ]]; then
    incl_ref="OTHERS=$lib_map_path/synopsys_sim.setup"
    echo $incl_ref >> $file
  fi
}

# Create design library directory paths
create_lib_dir()
{
  if [[ -e $sim_lib_dir ]]; then
    rm -rf $sim_lib_dir
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    lib_dir="$sim_lib_dir/$lib"
    if [[ ! -e $lib_dir ]]; then
      mkdir -p $lib_dir
    fi
  done
}

# Delete generated data from the previous run
reset_run()
{
  files_to_remove=(ucli.key design_1_simv vlogan.log vhdlan.log compile.log elaborate.log simulate.log .vlogansetup.env .vlogansetup.args .vcs_lib_lock scirocco_command.log 64 AN.DB csrc design_1_simv.daidir)
  for (( i=0; i<${#files_to_remove[*]}; i++ )); do
    file="${files_to_remove[i]}"
    if [[ -e $file ]]; then
      rm -rf $file
    fi
  done

  create_lib_dir
}

# Check command line arguments
check_args()
{
  if [[ ($1 == 1 ) && ($2 != "-lib_map_path" && $2 != "-noclean_files" && $2 != "-reset_run" && $2 != "-help" && $2 != "-h") ]]; then
    echo -e "ERROR: Unknown option specified '$2' (type \"./design_1.sh -help\" for more information)\n"
    exit 1
  fi

  if [[ ($2 == "-help" || $2 == "-h") ]]; then
    usage
  fi
}

# Script usage
usage()
{
  msg="Usage: design_1.sh [-help]\n\
Usage: design_1.sh [-lib_map_path]\n\
Usage: design_1.sh [-reset_run]\n\
Usage: design_1.sh [-noclean_files]\n\n\
[-help] -- Print help information for this script\n\n\
[-lib_map_path <path>] -- Compiled simulation library directory path. The simulation library is compiled\n\
using the compile_simlib tcl command. Please see 'compile_simlib -help' for more information.\n\n\
[-reset_run] -- Recreate simulator setup files and library mappings for a clean run. The generated files\n\
from the previous run will be removed. If you don't want to remove the simulator generated files, use the\n\
-noclean_files switch.\n\n\
[-noclean_files] -- Reset previous run, but do not remove simulator generated files from the previous run.\n\n"
  echo -e $msg
  exit 1
}

# Launch script
run $1 $2
