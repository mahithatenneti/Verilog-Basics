module mux_16x1(input [15:0]In, input [3:0]Select, output out);
wire [3:0]outp;
mux_4x1 mux1(.In(In[3:0]), .Select(Select[1:0]), .out(outp[0]));
mux_4x1 mux2(.In(In[7:4]), .Select(Select[1:0]), .out(outp[1]));
mux_4x1 mux3(.In(In[11:8]), .Select(Select[1:0]), .out(outp[2]));
mux_4x1 mux4(.In(In[15:12]), .Select(Select[1:0]), .out(outp[3]));
mux_4x1 mux5(.In(outp), .Select(Select[3:2]), .out(out));

endmodule
