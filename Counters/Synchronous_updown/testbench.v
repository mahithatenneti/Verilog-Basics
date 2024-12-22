module testbench;

    reg clk;          // Clock signal
    reg rst;          // Reset signal (active high)
    reg up_down;      // Control signal for up/down
    wire [3:0] Q;     // Output of the counter
    //reg preset;
    // Instantiate the up_down_counter module
    sync_updown uut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .Q(Q)
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
        rst = 1;
        #2;
        rst=0;
        #160;
        rst=1;
        #10;
        up_down = 1;  // Start by counting up
        rst=0;
        #160;
        // Stop simulation
        $stop;
    end

    // Monitor output to see the counter values
    initial begin
        $monitor("At time %t, up_down = %b, Q = %b", $time, up_down, Q);
    end

endmodule
