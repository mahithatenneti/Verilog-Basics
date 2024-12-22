module testbench;
reg clk,reset,a,b;
wire s,cout;
serial_adder UUT(cout,s,a,b,clk,reset);
always #5 clk=~clk;
initial begin
clk=0;reset=1;a=0;b=0;
#10 reset=0;a=1;b=0;
#10 a=0;b=0;
#10 a=1;b=1;
#10 a=0;b=1;
#10 a=1;b=0;
#10 a=0;b=1;
#10 a=0;b=1;
#10 a=1;b=1;
#10 $finish;
end
endmodule
