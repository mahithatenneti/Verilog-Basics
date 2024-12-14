module testbench;
reg [3:0]a;
reg [3:0]b;
reg cin;
wire [3:0]sum;
wire cout;
rca_4bit uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
initial begin
a = 4'b0000 ; b=4'b0010 ; cin =0; #10;
a = 4'b1110 ; b=4'b1010 ; cin =1; #10;
a = 4'b0110 ; b=4'b0110 ; cin =0; #10;
a = 4'b0010 ; b=4'b1101 ; cin =1; #10;
a = 4'b0001 ; b=4'b1010 ; cin =0; #10;
a = 4'b1110 ; b=4'b1100 ; cin =1; #10;
$finish;
end
endmodule
