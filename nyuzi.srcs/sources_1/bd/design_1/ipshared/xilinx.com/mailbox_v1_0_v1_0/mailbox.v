`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/18 12:07:02
// Design Name: 
// Module Name: mailbox
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


module mailbox(
    input wire clk,
    input wire reset,
    (*mark_debug="true"*)input wire io_from_nyuzi,
    input wire slv_reg3,
    (*mark_debug="true"*)output wire int_to_cpu,
    (*mark_debug="true"*)output wire int_to_nyuzi
    );
   // (*mark_debug="true"*)reg flag_int_to_cpu;
   // (*mark_debug="true"*)reg flag_int_to_nyuzi;
    
   (*mark_debug="true"*) reg[2:0] state_cur;
    reg[2:0] state_nxt;
    
    parameter s0 = 3'b000;
    parameter s1 = 3'b001;
    parameter s2 = 3'b010;
    parameter s3 = 3'b011;
    parameter s4 = 3'b100;
    parameter s5 = 3'b101;
    
    always@(posedge clk)
    begin
        if(reset == 0)
        begin
            state_cur <= s0;
        end
        else
        begin
            state_cur <= state_nxt;
        end
    end
    
    assign int_to_cpu = state_cur == s5;
    assign int_to_nyuzi = state_cur == s1;
    
    always@(state_cur or reset or slv_reg3 or io_from_nyuzi)
    begin
        if(reset == 0)
        begin
            state_nxt <= s0;
        end
        else
        case(state_cur)
            s0:state_nxt = (slv_reg3 == 1)?s1:s0;
            s1:state_nxt = s2;
            s2:state_nxt = s3;
            s3:state_nxt = (io_from_nyuzi == 1)?s4:s3;
            s4:state_nxt = (io_from_nyuzi == 0)?s5:s4;
            s5:state_nxt = s0;
            default:state_nxt <= s0;
        endcase
    end
    
endmodule
