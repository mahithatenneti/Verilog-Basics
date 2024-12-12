module testbench_4x1;
reg [3:0]In;
reg [1:0]Select;
wire out;
mux_4x1 uut (.In(In), .Select(Select), .out(out));
initial begin
In = 4'b1011; 
Select = 2'b00; #10;
Select = 2'b01; #10;
Select = 2'b10; #10;
Select = 2'b11; #10;
$finish;

end
endmodule
