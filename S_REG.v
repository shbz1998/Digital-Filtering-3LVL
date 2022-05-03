//NAME: SHAHBAZ HASSAN KHAN MALIK
//LAB 6B

`timescale 1 ns / 1 ns

module S_REG(CLK, DATA, OUT); 

parameter SIZE = 8; //Let the default width = 8 bits

input CLK;
input [SIZE-1:0] DATA; 
output reg [SIZE:0] OUT;

//BEHAVIOURAL MODELING
always @*

OUT <= DATA;


endmodule
