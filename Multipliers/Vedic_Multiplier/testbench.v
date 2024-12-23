module testbench;
reg [15:0]a,b;
wire [31:0]product;
vedic_multiplier UUT(a,b,product);
initial
begin
a=0;b=0;
#10 a=16'd137;b=16'd1;
#10 a=16'd17;b=16'd158;
#10 a=16'd257;b=16'd179;
#10 a=16'd32767;b=16'd32767;
#10 $finish;
end
endmodule
