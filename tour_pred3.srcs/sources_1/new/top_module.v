`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 06:02:57 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
input clk,
input reset,
input taken,
input [9:0] pc,
output pred_final
    );
    
    global_pred gp_inst(
    .clk(clk),
    .reset(reset),
    .taken(taken),
    .global_pred(global_pred),
    .GHSR(GHSR)
    );
    
    local_pred lp_inst(
    .clk(clk),
    .reset(reset),
    .pc(pc),
    .taken(taken),
    .local_pred(local_pred)
    );
    
    choice_pred cp_inst(
    .clk(clk),
    .reset(reset),
    .global_pred(global_pred),
    .local_pred(local_pred),
    .taken(taken),
    .GHSR(GHSR),
    .pred_final(pred_final)
    );
endmodule
