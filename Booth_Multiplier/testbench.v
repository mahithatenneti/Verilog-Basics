module testbench;
reg signed [15:0]X,Y;
wire signed [31:0]Z;
booths_multi UUT(X,Y,Z);
initial
begin
X=0;Y=0;
#10 X=-16'd5;Y=-16'd5;
#10 X=-16'd335;Y=16'd158;
#10 X=16'd244;Y=-16'd155;
#10 X=16'd2767;Y=16'd2767;
#10 $finish;
end
endmodule
