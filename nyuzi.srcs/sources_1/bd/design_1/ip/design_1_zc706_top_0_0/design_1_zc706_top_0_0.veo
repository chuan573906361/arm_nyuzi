// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:user:zc706_top:1.0
// IP Revision: 1

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
design_1_zc706_top_0_0 your_instance_name (
  .CLK(CLK),                          // input wire CLK
  .reset_btn(reset_btn),              // input wire reset_btn
  .start_interrupt(start_interrupt),  // input wire start_interrupt
  .red_led(red_led),                  // output wire [3 : 0] red_led
  .io_to_mailbox(io_to_mailbox),      // output wire io_to_mailbox
  .AWREADY(AWREADY),                  // input wire AWREADY
  .WREADY(WREADY),                    // input wire WREADY
  .BVALID(BVALID),                    // input wire BVALID
  .ARREADY(ARREADY),                  // input wire ARREADY
  .RVALID(RVALID),                    // input wire RVALID
  .RDATA(RDATA),                      // input wire [31 : 0] RDATA
  .AWADDR(AWADDR),                    // output wire [31 : 0] AWADDR
  .AWLEN(AWLEN),                      // output wire [7 : 0] AWLEN
  .AWVALID(AWVALID),                  // output wire AWVALID
  .WDATA(WDATA),                      // output wire [31 : 0] WDATA
  .WLAST(WLAST),                      // output wire WLAST
  .WVALID(WVALID),                    // output wire WVALID
  .BREADY(BREADY),                    // output wire BREADY
  .ARADDR(ARADDR),                    // output wire [31 : 0] ARADDR
  .ARLEN(ARLEN),                      // output wire [7 : 0] ARLEN
  .ARVALID(ARVALID),                  // output wire ARVALID
  .RREADY(RREADY),                    // output wire RREADY
  .AWSIZE(AWSIZE),                    // output wire [2 : 0] AWSIZE
  .AWBURST(AWBURST),                  // output wire [1 : 0] AWBURST
  .WSTRB(WSTRB),                      // output wire [3 : 0] WSTRB
  .ARSIZE(ARSIZE),                    // output wire [2 : 0] ARSIZE
  .ARBURST(ARBURST),                  // output wire [1 : 0] ARBURST
  .AWCACHE(AWCACHE),                  // output wire [3 : 0] AWCACHE
  .ARCACHE(ARCACHE)                  // output wire [3 : 0] ARCACHE
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file design_1_zc706_top_0_0.v when simulating
// the core, design_1_zc706_top_0_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

