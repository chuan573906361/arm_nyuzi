`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/19 16:13:19
// Design Name: 
// Module Name: zc706_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "defines.sv"

module zc706_top(
    input                       CLK,

    // Buttons
    input                       reset_btn,    // KEY[0]

    // Der blinkenlights
    input                       start_interrupt,
    output logic[3:0]          red_led,
    output logic               io_to_mailbox,
    
    //axi bus interface
    input logic AWREADY, 
    input logic WREADY, 
    input logic BVALID, 
    input logic ARREADY, 
    input logic RVALID,
    input logic[31:0] RDATA,
    output logic[31:0] AWADDR, 
    output logic[7:0] AWLEN, 
    output logic AWVALID,
    output logic[31:0] WDATA,
    output logic WLAST,
    output logic WVALID, 
    output logic BREADY, 
    output logic[31:0] ARADDR, 
    output logic[7:0] ARLEN,
    output logic ARVALID, 
    output logic RREADY, 
    output logic[2:0] AWSIZE,
    output logic[1:0] AWBURST,
    output logic[3:0] WSTRB,
    output logic[2:0] ARSIZE, 
    output logic[1:0] ARBURST, 
    output logic[3:0] AWCACHE, 
    output logic[3:0] ARCACHE
    );
    io_bus_interface nyuzi_io_bus();
    parameter BOOT_ROM_BASE = 32'h0;
    assign clk = CLK;
    logic reset;
    logic               processor_halt; 
    axi4_interface           axi_bus();
    //axi bus interface
    assign axi_bus.s_awready = AWREADY;
    assign axi_bus.s_wready = WREADY;
    assign axi_bus.s_bvalid = BVALID;
    assign axi_bus.s_arready = ARREADY;
    assign axi_bus.s_rvalid = RVALID;
    assign axi_bus.s_rdata = RDATA;
    assign AWADDR = axi_bus.m_awaddr;
    assign AWLEN = axi_bus.m_awlen;
    assign AWVALID = axi_bus.m_awvalid;
    assign WDATA = axi_bus.m_wdata;
    assign WLAST = axi_bus.m_wlast;
    assign WVALID = axi_bus.m_wvalid;
    assign BREADY = axi_bus.m_bready;
    assign ARADDR = axi_bus.m_araddr;
    assign ARLEN = axi_bus.m_arlen;
    assign ARVALID = axi_bus.m_arvalid;
    assign RREADY = axi_bus.m_rready;
    assign AWSIZE = axi_bus.m_awsize;
    assign AWBURST = axi_bus.m_awburst;
    assign WSTRB = axi_bus.m_wstrb;
    assign ARSIZE = axi_bus.m_arsize;
    assign ARBURST = axi_bus.m_arburst;
    assign AWCACHE = axi_bus.m_awcache;
    assign ARCACHE = axi_bus.m_arcache;
    
    
    nyuzi #(.RESET_PC(BOOT_ROM_BASE)) nyuzi(
            .interrupt_req({
                13'b0,
                start_interrupt,
                2'b0}),
            .axi_bus(axi_bus),
            .io_bus(nyuzi_io_bus),
            .*);
            
    synchronizer reset_synchronizer(
                    .clk(clk),
                    .reset(0),
                    .data_o(reset),
                    .data_i(!reset_btn)); 
                    
    always_ff @(posedge clk, posedge reset)
                        begin
                            if (reset)
                            begin
                                red_led <= 0;       
                                io_to_mailbox <= 0;     
                            end
                            else
                            begin
                                if (nyuzi_io_bus.write_en)
                                begin
                                    case (nyuzi_io_bus.address)
                                        'h00: red_led <= nyuzi_io_bus.write_data[3:0];
                                        'h04: io_to_mailbox <= nyuzi_io_bus.write_data[0];                    
                                    endcase
                                end
                            end
                        end
                        
    
endmodule
