module mux_8x1(input [7:0]In, input [2:0]Select, output out);
wire out1,out2;
mux_4x1 mux1(.In(In[3:0]), .Select(Select[1:0]), .out(out1));
mux_4x1 mux2(.In(In[7:4]), .Select(Select[1:0]), .out(out2));
assign out = ~Select[2] & out1 | Select[2] & out2;
endmodule
