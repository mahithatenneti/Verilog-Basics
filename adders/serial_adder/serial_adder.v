module dff(clk,reset,d,q);
input d,clk,reset;
output reg q;
always @(posedge d,posedge reset) begin
if(reset)
    q<=0;
else
    q<=d;
end
endmodule
//Full Adder
module fa(cy,s,a,b,c);
input a,b,c;
output cy,s;
assign s=a^b^c;
assign cy=(a&b)|(b&c)|(c&a);
endmodule
//Serial Adder
module serial_adder(cout,s,a,b,clk,reset);
input clk,reset,a,b;
output reg s,cout;
wire c,sw,cw;
fa f1(cw,sw,a,b,cout);
dff d1(clk,reset,cw,c);
always @(posedge clk,posedge reset)
begin
if (reset)
begin
s<=0;
cout<=0;
end
else
begin
s<=sw;
cout<=c;
end
end
endmodule
