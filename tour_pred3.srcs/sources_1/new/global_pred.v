`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 01:55:34 PM
// Design Name: 
// Module Name: global_pred
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


module global_pred(
input clk,
input reset,
input taken,
output reg global_pred,
output [11:0] GHSR
    );
    
    reg [11:0] GHSR;
    reg [1:0] GHT [0:4095];
    
    reg [11:0] g_buff1, g_buff2, g_buff3;
    reg taken1, taken2, taken3;
 
   
   assign pred_value = GHT[g_buff3];
    
    
integer i;    
always@(posedge clk)
begin
    if(reset)
        begin
        GHSR<=0;
        for(i=0;i<=4095;i=i+1)
            begin
                GHT[i]<=0;
            end
            g_buff1<=0;
            g_buff2<=0;
            g_buff3<=0;
            taken1<=0; 
            taken2<=0; 
            taken3<=0;

        end
        
        else
        begin
        case(taken3)
        1'b1:begin
        if(GHT[g_buff3]<2'b11)
        GHT[g_buff3]<=GHT[g_buff3]+1;
        end 
        1'b0:begin
        if(GHT[g_buff3]>2'b00)
        GHT[g_buff3]<= GHT[g_buff3]-1;
        end
        endcase
        GHSR<= {GHSR[10:0],taken3};
        end
        end
        
        always@(posedge clk)
        begin
        if(pred_value>2'b01)
        global_pred<=1'b1;
        else
        global_pred<=1'b0;
        end
        
        always@(posedge clk)
        begin
        if(!reset)
        begin
        g_buff1<=GHSR;
        g_buff2<=g_buff1;
        g_buff3<=g_buff2;
        
        taken1<=taken;
        taken2<=taken1;
        taken3<=taken2;
        end
        end
endmodule
