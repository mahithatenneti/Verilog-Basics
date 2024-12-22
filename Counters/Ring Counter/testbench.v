module testbench;
    reg clk,clr;
    wire [3:0]q;
    ring_count dut1(.q(q),.clk(clk),.clr(clr));
    initial begin
    clk = 1;
    forever #50 clk = ~clk;  // Toggle clock every 50 time units
    end
    initial begin
    clr=1;#50;
    clr=0;#50;
    end
endmodule
