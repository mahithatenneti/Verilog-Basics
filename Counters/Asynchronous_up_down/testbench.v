module tb_up_down_counter;

    reg clk;          // Clock signal
    reg clear;          // Reset signal (active high)
    reg up_down;      // Control signal for up/down
    wire [3:0] q;     // Output of the counter
    //reg preset;
    // Instantiate the up_down_counter module
    asynchronous_updown uut (
        .clk(clk),
        .clear(clear),
        .up_down(up_down),
        .q(q)
    );

    // Generate a clock signal (period of 10 time units)
    always begin
        #5 clk = ~clk;
    end

    // Initial block for stimulus
    initial begin
        // Initialize signals
        up_down = 0;
        clk = 0;
        clear = 1;
        #2;
        clear=0;
        #160;
        clear=1;
        #10;
        up_down = 1;  // Start by counting up
        clear=0;
        #160;
        // Stop simulation
        $stop;
    end

    // Monitor output to see the counter values
    initial begin
        $monitor("At time %t, up_down = %b, Q = %b", $time, up_down, q);
    end

endmodule
