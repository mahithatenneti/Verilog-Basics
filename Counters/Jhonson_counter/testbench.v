module jhonson_counter_test();
    reg clk,clr;
    wire [3:0]q;
    jhonson_counter dut1(.q(q),.clk(clk),.clr(clr));
    initial begin
    clk = 1;
    forever #50 clk = ~clk;  // Toggle clock every 5 time units
    end
    initial begin
    clr=1;#50;
    clr=0;#50;
    end
endmodule
