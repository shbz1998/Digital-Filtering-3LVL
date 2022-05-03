//NAME: SHAHBAZ HASSAN KHAN MALIK
//LAB 6B

`timescale 1 ns / 1 ns

module NON_H(OUTPUT, DATA, C0, C1, C2, C3, CLK); 

parameter SIZE = 8; //Let the default width = 8 bits

input[SIZE-1:0] DATA, CLK; //4 bits
input[SIZE:0] C0,C1,C2,C3; //5bits
output reg[2*SIZE+1:0]  OUTPUT; //12bits


always @*

OUTPUT <= DATA*C0 + DATA*C1 + DATA*C2 + DATA*C3;


endmodule
