
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z045ffg900-2
#    set_property BOARD_PART xilinx.com:zc706:part0:1.2 [current_project]

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]

  # Create ports
  set ext_reset_in [ create_bd_port -dir I -type rst ext_reset_in ]
  set red_led [ create_bd_port -dir O -from 3 -to 0 red_led ]

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
 ] $axi_mem_intercon

  # Create instance: mailbox_v1_0_0, and set properties
  set mailbox_v1_0_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:mailbox_v1_0:1.0 mailbox_v1_0_0 ]

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
CONFIG.PCW_IRQ_F2P_INTR {1} \
CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
CONFIG.PCW_USE_S_AXI_HP0 {1} \
CONFIG.preset {ZC706} \
 ] $processing_system7_0

  # Create instance: processing_system7_0_axi_periph, and set properties
  set processing_system7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 processing_system7_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
 ] $processing_system7_0_axi_periph

  # Create instance: zc706_top_0, and set properties
  set zc706_top_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:zc706_top:1.0 zc706_top_0 ]
  set_property -dict [ list \
CONFIG.BOOT_ROM_BASE {0x10000000} \
 ] $zc706_top_0

  # Create interface connections
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins processing_system7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins mailbox_v1_0_0/s00_axi] [get_bd_intf_pins processing_system7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net zc706_top_0_interface_aximm [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins zc706_top_0/interface_aximm]

  # Create port connections
  connect_bd_net -net ext_reset_in_1 [get_bd_ports ext_reset_in] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net mailbox_v1_0_0_int_to_cpu [get_bd_pins mailbox_v1_0_0/int_to_cpu] [get_bd_pins processing_system7_0/IRQ_F2P]
  connect_bd_net -net mailbox_v1_0_0_int_to_nyuzi [get_bd_pins mailbox_v1_0_0/int_to_nyuzi] [get_bd_pins zc706_top_0/start_interrupt]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins processing_system7_0_axi_periph/ARESETN]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins mailbox_v1_0_0/s00_axi_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins processing_system7_0_axi_periph/M00_ARESETN] [get_bd_pins processing_system7_0_axi_periph/S00_ARESETN] [get_bd_pins zc706_top_0/reset_btn]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins mailbox_v1_0_0/s00_axi_aclk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins processing_system7_0_axi_periph/ACLK] [get_bd_pins processing_system7_0_axi_periph/M00_ACLK] [get_bd_pins processing_system7_0_axi_periph/S00_ACLK] [get_bd_pins zc706_top_0/CLK]
  connect_bd_net -net zc706_top_0_io_to_mailbox [get_bd_pins mailbox_v1_0_0/io_from_nyuzi] [get_bd_pins zc706_top_0/io_to_mailbox]
  connect_bd_net -net zc706_top_0_red_led [get_bd_ports red_led] [get_bd_pins zc706_top_0/red_led]

  # Create address segments
  create_bd_addr_seg -range 0x1000 -offset 0x40000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs mailbox_v1_0_0/s00_axi/reg0] SEG_mailbox_v1_0_0_reg0
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces zc706_top_0/interface_aximm] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port DDR -pg 1 -y -130 -defaultsOSRD
preplace port FIXED_IO -pg 1 -y -110 -defaultsOSRD
preplace port ext_reset_in -pg 1 -y 20 -defaultsOSRD
preplace portBus red_led -pg 1 -y -200 -defaultsOSRD
preplace inst zc706_top_0 -pg 1 -lvl 1 -y -200 -defaultsOSRD
preplace inst proc_sys_reset_0 -pg 1 -lvl 1 -y 40 -defaultsOSRD
preplace inst mailbox_v1_0_0 -pg 1 -lvl 2 -y -190 -defaultsOSRD
preplace inst axi_mem_intercon -pg 1 -lvl 4 -y 250 -defaultsOSRD
preplace inst processing_system7_0_axi_periph -pg 1 -lvl 4 -y 10 -defaultsOSRD
preplace inst processing_system7_0 -pg 1 -lvl 3 -y -49 -defaultsOSRD
preplace netloc processing_system7_0_DDR 1 3 2 NJ -130 NJ
preplace netloc processing_system7_0_axi_periph_M00_AXI 1 1 4 400 -330 NJ -330 NJ -330 1400
preplace netloc mailbox_v1_0_0_int_to_cpu 1 2 1 640
preplace netloc processing_system7_0_M_AXI_GP0 1 3 1 1080
preplace netloc axi_mem_intercon_M00_AXI 1 2 3 660 -180 NJ -180 1390
preplace netloc zc706_top_0_red_led 1 1 4 NJ -310 NJ -310 NJ -310 NJ
preplace netloc proc_sys_reset_0_interconnect_aresetn 1 1 3 NJ 60 NJ 80 1110
preplace netloc zc706_top_0_io_to_mailbox 1 1 1 370
preplace netloc zc706_top_0_interface_aximm 1 1 3 NJ -270 NJ -270 1090
preplace netloc processing_system7_0_FIXED_IO 1 3 2 NJ -110 NJ
preplace netloc ext_reset_in_1 1 0 1 N
preplace netloc proc_sys_reset_0_peripheral_aresetn 1 0 4 40 -130 380 90 NJ 90 1100
preplace netloc processing_system7_0_FCLK_CLK0 1 0 4 20 -270 NJ -280 NJ -190 1070
preplace netloc mailbox_v1_0_0_int_to_nyuzi 1 0 3 30 -290 NJ -290 640
levelinfo -pg 1 0 200 520 860 1250 1570 -top -340 -bot 370
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


