module testbench;

reg [2:0]I;
wire [7:0]O;
decimal_decoder uut(.I(I),.O(O));
initial begin
    I = 3'b000; #10;
    I = 3'b001; #10;
    I = 3'b010; #10;
    I = 3'b011; #10;
    I = 3'b100; #10;
    I = 3'b101; #10;
    I = 3'b110; #10;
    I = 3'b111; #10;
$finish;
end
endmodule
