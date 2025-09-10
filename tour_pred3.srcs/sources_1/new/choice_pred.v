`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 04:28:26 PM
// Design Name: 
// Module Name: choice_pred
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


module choice_pred(
input clk,
input reset,
input global_pred,
input local_pred,
input taken,
input [11:0] GHSR,
output reg pred_final
    );
    
    reg [1:0] choice_reg [0:4095];
    reg update, update1, update2, update3;
    reg correct1, correct2, correct3;
    reg [0:11] g_buff1,g_buff2,g_buff3;
    reg taken1, taken2, taken3;
    
    assign correct = (global_pred==taken);
    
    integer i;
    always@(posedge clk)
    begin
    if(reset)
        for(i=0;i<=4095;i=i+1)
            begin
                choice_reg[i] <=2'b00;
            end
            g_buff1<=0;
            g_buff2<=0;
            g_buff3<=0;
            update1<=0; 
            update2<=0; 
            update3<=0;
            correct1<=0; 
            correct2<=0; 
            correct3<=0;
            taken1<=0; 
            taken2<=0; 
            taken3<=0;
        end
            
            
            
    always@(*)
    begin 
    if(local_pred == global_pred)
    begin
    pred_final <= local_pred;
    update <= 0;
    end
    
    else
    begin
    update <= 1'b1;
    if (choice_reg[GHSR]>1'b1)
    pred_final <= global_pred;
    else
    pred_final <=local_pred;
    end
    end
    
    
    always@(posedge clk)
    begin
    if(update3)
        begin
        case(correct3)
        1'b1: begin
        choice_reg[g_buff3]<=choice_reg[g_buff3]+1;
        end
        
        1'b0: begin
        choice_reg[g_buff3]<=choice_reg[g_buff3]-1;
            end
        endcase
        update3<=0;
        end
        end
        
        
        always@(posedge clk)
        begin
    if(!reset)
    begin
        g_buff1<=GHSR;
        update1<=update;
        correct1<=correct;
        taken1<=taken;

        g_buff2<=g_buff1;;
        update2<=update1;
        correct2=correct1;
        taken2<=taken1;
        
        g_buff3<=g_buff2;
        update3<=update2;
        correct3<=correct2;
        taken3<=taken2;
        
      end
 end 
endmodule
