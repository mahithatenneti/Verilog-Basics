module testbench;
reg [7:0]a,b;
reg cin;
wire [7:0]s;
wire cy;
ksa UUT(cy,s,a,b,cin);
initial begin
a=8'b00000000;b=8'b00000000;cin=1'b0;
#10 a=8'b10001001;b=8'b10001001;
#10 a=8'b10100110;b=8'b10110110;
#10 a=8'b01000100;b=8'b01000101;
#10
$finish;
end
endmodule
