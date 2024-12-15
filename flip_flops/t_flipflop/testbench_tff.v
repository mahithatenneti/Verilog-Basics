module t_flipflop_tb;
    reg T;
    reg clk;
    wire Q;

    // Instantiate the T flip-flop
    t_flipflop uut (
        .T(T),
        .clk(clk),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 1;
        forever #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    // Test cases
    initial begin

        // Initialize inputs
        T = 0; #10;
        T = 1; #10;
        T = 0; #10;
        T = 1; #10;
        
        $finish;
    end
endmodule
