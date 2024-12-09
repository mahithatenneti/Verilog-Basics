module testbench;

reg [3:0]I;
wire [1:0]O;
encoder uut(.I(I),.O(O));
initial begin
    I = 4'b0000; #10;
    I = 4'b0001; #10;
    I = 4'b0010; #10;
    I = 4'b0100; #10;
    I = 4'b1000; #10;
$finish;
end
