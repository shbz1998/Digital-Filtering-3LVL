//NAME: SHAHBAZ HASSAN KHAN MALIK
//LAB 6B
`timescale 1 ns / 1 ns

module TOP_LEVEL (DATA, C0, C1,C2,C3, OUTPUT, CLK);
parameter SIZE = 8; 
input[SIZE-1:0] DATA, CLK; //4 bits
input[SIZE:0] C0,C1,C2,C3; //5bits
output[2*SIZE+1:0] OUTPUT; //12bits
wire[SIZE:0] REG_OUT_1, REG_OUT_2, REG_OUT_3, REG_OUT_4; //5bits
wire[2*SIZE-1:0]  PROD_1, PROD_2, PROD_3, PROD_4; //10bits
wire[2*SIZE:0]  SUM_1, SUM_2; //11bits

S_REG #(SIZE) reg_1(.CLK(CLK), .DATA(DATA), .OUT(REG_OUT_1)); //produce bit+1 size
S_REG #(SIZE) reg_2(.CLK(CLK), .DATA(REG_OUT_1), .OUT(REG_OUT_2));
S_REG #(SIZE) reg_3(.CLK(CLK), .DATA(REG_OUT_2), .OUT(REG_OUT_3));
S_REG #(SIZE) reg_4(.CLK(CLK), .DATA(REG_OUT_3), .OUT(REG_OUT_4));

S_MUL #(SIZE+1) mul_1(.PROD(PROD_1), .A(C0), .B(REG_OUT_1)); //produce 2*bit
S_MUL #(SIZE+1) mul_2(.PROD(PROD_2), .A(C1), .B(REG_OUT_2));
S_MUL #(SIZE+1) mul_3(.PROD(PROD_3), .A(C2), .B(REG_OUT_3));
S_MUL #(SIZE+1) mul_4(.PROD(PROD_4), .A(C3), .B(REG_OUT_4));

S_ADD #(SIZE+2) add_1(.SUM(SUM_1), .A(PROD_1), .B(PROD_2));
S_ADD #(SIZE+2) add_2(.SUM(SUM_2), .A(PROD_2), .B(PROD_3));
S_ADD #(SIZE+4) add_3(.SUM(OUTPUT), .A(SUM_1), .B(SUM_2));



endmodule
