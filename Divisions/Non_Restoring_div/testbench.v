module testbench;
    reg [4:0]a; //divisor
    reg [3:0]b; //dividend
    wire [4:0] rem;
    wire [3:0] Q_out;   //O_out= b/a;
    
non_restoring_division uut(.Q(b),.M(a),.Q_out(Q_out),.rem(rem));
    initial begin
        b=2;a=1;
        #100;
        b=5;a=3;
        #100;
        b=14;a=7;
        #100;
        b=11;a=4;
        #100;
        b=15;a=5;
        #100 $finish;
        
    end
endmodule
