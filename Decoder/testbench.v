module testbench;

reg [1:0]I;
wire [3:0]O;
decoder_2_4 uut(.I(I),.O(O));
initial begin
    I = 2'b00; #10;
    I = 2'b01; #10;
    I = 2'b10; #10;
    I = 2'b11; #10;
$finish;
end
endmodule
