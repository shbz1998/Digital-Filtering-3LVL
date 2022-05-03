`timescale 1 ns / 1 ns
`define MONITOR_STR_1 " MONITOR: %d: DATA_in=%d, C0=%d, C1=%d, C2=%d, C3=%d |OUTPUT=%d | OUTPUT of NON Heirachal Module=%d"
`define FORCE_ERROR //this will apply forced error

module TOP_LEVEL_EXH_TB();
//USING SIZES 1, 3, 4, 6

parameter CLK_PERIOD=42.8;
parameter SIZE = 8; 
reg[SIZE-1:0] DATA;
reg[SIZE:0] C0,C1,C2,C3;
reg CLK;
wire[2*SIZE+1:0] OUTPUT, OUTPUT_EXPECTED;
integer i, j;

//4 BITS
TOP_LEVEL #(SIZE) my_top_level(.DATA(DATA), .CLK(CLK), .OUTPUT(OUTPUT), .C0(C0), .C1(C1), .C2(C2), .C3(C3));

NON_H #(SIZE) my_non_h(.DATA(DATA), .CLK(CLK), .OUTPUT(OUTPUT_EXPECTED), .C0(C0), .C1(C1), .C2(C2), .C3(C3));

initial begin
     $vcdpluson;
     $monitor(`MONITOR_STR_1 ,$time, DATA, C0, C1, C2, C3, OUTPUT,OUTPUT_EXPECTED);
end


initial begin

		CLK = 0;
		forever begin
			#(CLK_PERIOD/2) CLK=~CLK;
		end
end

initial
begin

$display("TESTING for 4 bits");


#320 DATA=8'b00000000; C0=8'b00000101; C1=8'b00000001; C2=8'b00000001; C3=8'b00000001;

for(i=0; i<64; i=i+1)
begin

//let us increment the DATA
#320 DATA=DATA+1'b1;

if (DATA==12) $monitoroff; //MONITOR OFF after first dozen values

else;

if(OUTPUT!=OUTPUT_EXPECTED) begin //is there already an error in our design?

$display("ERROR! THIS OUTPUT IS NOT EQUAL TO THE EXPECTED");
$finish;

end //IF statement
else;			//if not then FORCE the error IF the FORCE_ERROR directive is used
//focing an error
`ifdef FORCE_ERROR
begin
if(DATA==19) $monitoron;
else;
if(DATA==32) force OUTPUT=2;

else;
end //ifDEF
`endif
end //FOR LOOP 

$display("Our EXHAUSTIVE testbench was successful");

#340 $finish;
end //BEGIN..END

endmodule
