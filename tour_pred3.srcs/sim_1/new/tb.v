`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 07:32:28 PM
// Design Name: 
// Module Name: tb
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


module tb_top;


reg clk;
reg reset;
reg [9:0] pc;
reg taken;
wire pred_final;


top_module uut (
    .clk(clk),
    .reset(reset),
    .pc(pc),
    .taken(taken),
    .pred_final(pred_final)
);


always #5 clk = ~clk;  

initial begin

    clk = 1;
    reset = 1;
    pc = 0;
    taken = 0;
    

    #10 reset = 0; 

    //taken

    pc = 10'b0000000001; taken = 1; #10;
    pc = 10'b0000000001;taken = 1; #10;
    

    pc = 10'b0000000001;taken = 1; #10;
    pc = 10'b0000000001; taken = 1; #10;
    

    pc = 10'b0000000001; taken = 1; #10;
    pc = 10'b0000000001; taken = 1; #10;
    

    pc = 10'b0000000001; taken = 1; #10;
    pc = 10'b0000000001; taken = 1; #10;

   
    pc = 10'b0000000001; taken = 1; #10;
    pc = 10'b0000000001; taken = 1; #10;
    pc = 10'b0000000001; taken = 1; #10;
    
    // not taken
    
    /*pc = 10'b0000000001; taken = 0; #10;
    pc = 10'b0000000001; taken = 0; #10;
    

    pc = 10'b0000000001; taken = 0; #10;
    pc = 10'b0000000001; taken = 0; #10;
    

    pc = 10'b0000000001; taken = 0; #10;
    pc = 10'b0000000001; taken = 0; #10;
    

    pc = 10'b0000000001; taken = 0; #10;
    pc = 10'b0000000001; taken = 0; #10;

   
    pc = 10'b0000000001; taken = 0; #10;
    pc = 10'b0000000001; taken = 0; #10;
    pc = 10'b0000000001; taken = 0; #10;*/

    #150;
    $finish;
end

endmodule

