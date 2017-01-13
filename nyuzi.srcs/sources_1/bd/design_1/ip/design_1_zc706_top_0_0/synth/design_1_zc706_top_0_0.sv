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

(* X_CORE_INFO = "zc706_top,Vivado 2015.4" *)
(* CHECK_LICENSE_TYPE = "design_1_zc706_top_0_0,zc706_top,{}" *)
(* CORE_GENERATION_INFO = "design_1_zc706_top_0_0,zc706_top,{x_ipProduct=Vivado 2015.4,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=zc706_top,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,BOOT_ROM_BASE=0x10000000}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_zc706_top_0_0 (
  CLK,
  reset_btn,
  start_interrupt,
  red_led,
  io_to_mailbox,
  AWREADY,
  WREADY,
  BVALID,
  ARREADY,
  RVALID,
  RDATA,
  AWADDR,
  AWLEN,
  AWVALID,
  WDATA,
  WLAST,
  WVALID,
  BREADY,
  ARADDR,
  ARLEN,
  ARVALID,
  RREADY,
  AWSIZE,
  AWBURST,
  WSTRB,
  ARSIZE,
  ARBURST,
  AWCACHE,
  ARCACHE
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *)
input wire CLK;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset_btn RST" *)
input wire reset_btn;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 start_interrupt INTERRUPT" *)
input wire start_interrupt;
output wire [3 : 0] red_led;
output wire io_to_mailbox;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWREADY" *)
input wire AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WREADY" *)
input wire WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BVALID" *)
input wire BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARREADY" *)
input wire ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RVALID" *)
input wire RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RDATA" *)
input wire [31 : 0] RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWADDR" *)
output wire [31 : 0] AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWLEN" *)
output wire [7 : 0] AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWVALID" *)
output wire AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WDATA" *)
output wire [31 : 0] WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WLAST" *)
output wire WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WVALID" *)
output wire WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BREADY" *)
output wire BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARADDR" *)
output wire [31 : 0] ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARLEN" *)
output wire [7 : 0] ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARVALID" *)
output wire ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RREADY" *)
output wire RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWSIZE" *)
output wire [2 : 0] AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWBURST" *)
output wire [1 : 0] AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WSTRB" *)
output wire [3 : 0] WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARSIZE" *)
output wire [2 : 0] ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARBURST" *)
output wire [1 : 0] ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWCACHE" *)
output wire [3 : 0] AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARCACHE" *)
output wire [3 : 0] ARCACHE;

  zc706_top #(
    .BOOT_ROM_BASE('H10000000)
  ) inst (
    .CLK(CLK),
    .reset_btn(reset_btn),
    .start_interrupt(start_interrupt),
    .red_led(red_led),
    .io_to_mailbox(io_to_mailbox),
    .AWREADY(AWREADY),
    .WREADY(WREADY),
    .BVALID(BVALID),
    .ARREADY(ARREADY),
    .RVALID(RVALID),
    .RDATA(RDATA),
    .AWADDR(AWADDR),
    .AWLEN(AWLEN),
    .AWVALID(AWVALID),
    .WDATA(WDATA),
    .WLAST(WLAST),
    .WVALID(WVALID),
    .BREADY(BREADY),
    .ARADDR(ARADDR),
    .ARLEN(ARLEN),
    .ARVALID(ARVALID),
    .RREADY(RREADY),
    .AWSIZE(AWSIZE),
    .AWBURST(AWBURST),
    .WSTRB(WSTRB),
    .ARSIZE(ARSIZE),
    .ARBURST(ARBURST),
    .AWCACHE(AWCACHE),
    .ARCACHE(ARCACHE)
  );
endmodule
