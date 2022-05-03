//NAME: SHAHBAZ HASSAN KHAN MALIK
//LAB 6B

`timescale 1 ns / 1 ns

module S_MUL (PROD, A, B);
parameter SIZE = 4; //DEFAULT WIDTH
output reg [SIZE*2-1:0] PROD; //16
input  [SIZE-1:0] A; //8
input  [SIZE-1:0] B; //8
reg [2*SIZE:0] i;
reg [2*SIZE-1:0] REG;
reg [2*SIZE-1:0] TMP;
reg enable;
reg [2*SIZE-1:0]PROD;

 initial
  begin
    i<=0;
    REG<=0;
  end

 always @( A or B)
  begin
    enable<=1;
    i<=0;
    REG<=0;

  end

always @*
  begin
    if(enable)
    begin
      
      if(i<SIZE)
      begin
        if(i==0) TMP={0,B};
        TMP<=TMP<<1;
        if(A[i])
        begin  
          
          REG<=REG+TMP;
        end
        i<=i+1;
        
      end
      else if(i==SIZE)
      begin
        PROD<=REG;
        i=0;
        REG<=0;
        enable<=0;
        
      end
    end
  end


endmodule
