`timescale 1 ns / 1 ns
`define MONITOR_STR_1 " MONITOR: %d: DATA_in=%d, C0=%d, C1=%d, C2=%d, C3=%d |OUTPUT=%d | OUTPUT=%b"

module TOP_LEVEL_TB();
//USING SIZES 1, 3, 4, 6

parameter CLK_PERIOD=42.8;
parameter SIZE = 8; 
reg[SIZE-1:0] DATA;
reg[SIZE:0] C0,C1,C2,C3;
reg CLK;
wire[2*SIZE+1:0] OUTPUT;

//4 BITS
TOP_LEVEL #(SIZE) my_top_level(.DATA(DATA), .CLK(CLK), .OUTPUT(OUTPUT), .C0(C0), .C1(C1), .C2(C2), .C3(C3));



initial begin
     $vcdpluson;
     $monitor(`MONITOR_STR_1 ,$time, DATA, C0, C1, C2, C3, OUTPUT,OUTPUT);
end

//"Use as many of the least significant bits of the A and B buses as needed to drive the smaller instances"

initial begin

		CLK = 0;
		forever begin
			#(CLK_PERIOD/2) CLK=~CLK;
		end
end

initial
begin
$vcdpluson;
$display("TESTING for 4 bits");

#320 DATA=4'b0101; C0=4'b0101; C1=4'b0001; C2=4'b0001; C3=4'b0001;

#320 DATA=4'b1101; C0=4'b0101; C1=4'b0001; C2=4'b0001; C3=4'b0001;

#320 DATA=16; C0=8'b00000101; C1=8'b00000011; C2=8'b00000001; C3=8'b00000001;

#320 $finish;

end



endmodule
