//NAME: SHAHBAZ HASSAN KHAN MALIK
//LAB 6B

`timescale 1 ns / 1 ns

module S_ADD(A, B, SUM); 

parameter SIZE = 4; //Let the default width = 8 bits

input [SIZE-1:0] A,B;
output reg [SIZE:0] SUM;

//BEHAVIOURAL MODELING
always @*
begin
 assign SUM = A+B;
end
endmodule
