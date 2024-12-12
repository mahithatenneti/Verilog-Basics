module testbench_8x1;
reg [7:0]In;
reg [2:0]Select;
wire out;
mux_8x1 uut (.In(In), .Select(Select), .out(out));
initial begin
In = 4'b01101011; 
Select = 3'b000; #10;
Select = 3'b001; #10;
Select = 3'b010; #10;
Select = 3'b011; #10;
Select = 3'b100; #10;
Select = 3'b101; #10;
Select = 3'b110; #10;
Select = 3'b111; #10;
$finish;

end
endmodule
