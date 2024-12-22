module testbench;
reg [7:0]a,b;
reg cin;
wire [7:0]s;
wire cy;
csa UUT(cy,s,a,b,cin);
initial begin
a=8'b00000000;b=8'b00000000;cin=1'b0;#10;
a=8'b10001000;b=8'b10001000;cin=1'b0;#10;
a=8'b10100110;b=8'b10110110;cin=1'b0;#10;
a=8'b01000100;b=8'b01000101;cin=1'b0;#10;
$finish;
end
endmodule
