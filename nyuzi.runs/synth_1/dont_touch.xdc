# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# XDC: new/nyuzi.xdc

# Block Designs: bd/design_1/design_1.bd
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1 || ORIG_REF_NAME==design_1}]

# IP: bd/design_1/ip/design_1_processing_system7_0_0/design_1_processing_system7_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_processing_system7_0_0 || ORIG_REF_NAME==design_1_processing_system7_0_0}]

# IP: bd/design_1/ip/design_1_mailbox_v1_0_0_0/design_1_mailbox_v1_0_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_mailbox_v1_0_0_0 || ORIG_REF_NAME==design_1_mailbox_v1_0_0_0}]

# IP: bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_proc_sys_reset_0_0 || ORIG_REF_NAME==design_1_proc_sys_reset_0_0}]

# IP: bd/design_1/ip/design_1_zc706_top_0_0/design_1_zc706_top_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_zc706_top_0_0 || ORIG_REF_NAME==design_1_zc706_top_0_0}]

# IP: bd/design_1/ip/design_1_axi_mem_intercon_0/design_1_axi_mem_intercon_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_axi_mem_intercon_0 || ORIG_REF_NAME==design_1_axi_mem_intercon_0}]

# IP: bd/design_1/ip/design_1_processing_system7_0_axi_periph_0/design_1_processing_system7_0_axi_periph_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_processing_system7_0_axi_periph_0 || ORIG_REF_NAME==design_1_processing_system7_0_axi_periph_0}]

# IP: bd/design_1/ip/design_1_auto_pc_0/design_1_auto_pc_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_auto_pc_0 || ORIG_REF_NAME==design_1_auto_pc_0}]

# IP: bd/design_1/ip/design_1_auto_us_0/design_1_auto_us_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_auto_us_0 || ORIG_REF_NAME==design_1_auto_us_0}]

# IP: bd/design_1/ip/design_1_auto_pc_1/design_1_auto_pc_1.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_auto_pc_1 || ORIG_REF_NAME==design_1_auto_pc_1}]

# XDC: bd/design_1/ip/design_1_processing_system7_0_0/design_1_processing_system7_0_0.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==design_1_processing_system7_0_0 || ORIG_REF_NAME==design_1_processing_system7_0_0}] {/inst }]/inst ]]

# XDC: bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0_board.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_proc_sys_reset_0_0 || ORIG_REF_NAME==design_1_proc_sys_reset_0_0}]

# XDC: bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_proc_sys_reset_0_0 || ORIG_REF_NAME==design_1_proc_sys_reset_0_0}]

# XDC: bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0_ooc.xdc

# XDC: bd/design_1/ip/design_1_auto_pc_0/design_1_auto_pc_0_ooc.xdc

# XDC: bd/design_1/ip/design_1_auto_us_0/design_1_auto_us_0_ooc.xdc

# XDC: bd/design_1/ip/design_1_auto_us_0/design_1_auto_us_0_clocks.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==design_1_auto_us_0 || ORIG_REF_NAME==design_1_auto_us_0}] {/inst }]/inst ]]

# XDC: bd/design_1/ip/design_1_auto_pc_1/design_1_auto_pc_1_ooc.xdc

# XDC: bd/design_1/design_1_ooc.xdc