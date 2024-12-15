module testbench_sr;
    reg S;
    reg R;
    reg clk;
    wire Q;
    wire Qbar;

    // Instantiate the D flip-flop
sr_flipflop uut (.S(S),.R(R),.clk(clk),.Q(Q),.Qbar(Qbar) );

    // Clock generation
    initial begin
        clk = 1;
        forever #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    // Test cases
    initial begin

        // Initialize inputs
        S = 0; R =1; #10;
        S = 0; R =0; #10;
        S = 1; R =0; #10;
        S = 1; R =1; #10;
        
        $finish;
    end
endmodule
