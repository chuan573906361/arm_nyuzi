# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_param simulator.modelsimInstallPath D:/modelsim/win64
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z045ffg900-2

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir G:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.cache/wt [current_project]
set_property parent.project_path G:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:zc706:part0:1.2 [current_project]
set_property ip_repo_paths {
  g:/xilinx_project/zynq_nyuzi_ip_0109
  g:/xilinx_project/zynq_nyuzi_mailbox_ip_0110_2/mailbox
} [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
add_files G:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.srcs/sources_1/bd/design_1/design_1.bd
set_property used_in_implementation false [get_files -all g:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0/design_1_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all g:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.srcs/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0_board.xdc]
set_property used_in_implementation false [get_files -all g:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.srcs/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0.xdc]
set_property used_in_implementation false [get_files -all g:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.srcs/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all g:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.srcs/sources_1/bd/design_1/ip/design_1_auto_pc_0/design_1_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all g:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.srcs/sources_1/bd/design_1/ip/design_1_auto_us_0/design_1_auto_us_0_ooc.xdc]
set_property used_in_implementation false [get_files -all g:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.srcs/sources_1/bd/design_1/ip/design_1_auto_us_0/design_1_auto_us_0_clocks.xdc]
set_property used_in_implementation false [get_files -all g:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.srcs/sources_1/bd/design_1/ip/design_1_auto_pc_1/design_1_auto_pc_1_ooc.xdc]
set_property used_in_implementation false [get_files -all G:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.srcs/sources_1/bd/design_1/design_1_ooc.xdc]
set_property is_locked true [get_files G:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.srcs/sources_1/bd/design_1/design_1.bd]

read_verilog -library xil_defaultlib G:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v
read_xdc G:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.srcs/constrs_1/new/nyuzi.xdc
set_property used_in_implementation false [get_files G:/xilinx_project/zynq_nyuzi_0111/nyuzi/nyuzi.srcs/constrs_1/new/nyuzi.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
synth_design -top design_1_wrapper -part xc7z045ffg900-2
write_checkpoint -noxdef design_1_wrapper.dcp
catch { report_utilization -file design_1_wrapper_utilization_synth.rpt -pb design_1_wrapper_utilization_synth.pb }