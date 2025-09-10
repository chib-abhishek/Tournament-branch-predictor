`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 11:14:41 AM
// Design Name: 
// Module Name: local_pred
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


module local_pred(
input clk,
input reset,
input [9:0] pc,
input taken,
output reg local_pred
    );


reg [9:0] LHT [0:1023];
reg [2:0] LP [0:1023];

reg taken1, taken2, taken3;
reg [9:0] pc1, pc2, pc3;

reg [9:0] LHT_value, update_lht;
reg [2:0] pred_value;

always@(*)
begin
LHT_value = LHT[pc];
pred_value = LP[LHT_value];
update_lht = LHT[pc3];
end
integer i;

always@(posedge clk)
begin
if(reset)
begin
for (i=0; i<=1023; i=i+1)
begin
LHT[i] <= 0;
LP[i] <= 0;
end
pc1 <= 0;
pc2 <= 0;
pc3 <= 0;
taken1 <= 0;
taken2 <= 0;
taken3 <= 0;
end

else
begin
case(taken3)

1'b1:begin
if(LP[update_lht]<3'b111)
LP[update_lht]<=LP[update_lht]+1;
end

1'b0:begin
if(LP[update_lht]>3'b000)
LP[update_lht]<=LP[update_lht]-1;
end
endcase
LHT[pc] <= {LHT[pc][8:0], taken3};
end
end

always@(posedge clk)
begin
if(pred_value>3'b100)
local_pred <= 1'b1;
else
local_pred <= 1'b0;
end

always@(posedge clk)
begin
if(!reset)
begin
pc1<=pc;
pc2<=pc1;
pc3<=pc2;

taken1<=taken;
taken2<=taken1;
taken3<=taken2;
end
end
endmodule


