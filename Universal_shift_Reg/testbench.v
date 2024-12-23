module testbench;
  // Testbench signals
  reg clk, clr, pren, data_in;
  reg [7:0] pr;
  wire [7:0] q;
  wire data_out;

  // Instantiate the usr module
  usr UUT (
    .clk(clk),
    .clr(clr),
    .pren(pren),
    .data_in(data_in),
    .pr(pr),
    .q(q),
    .data_out(data_out)
  );

  // Clock generation
  always #5 clk = ~clk;  // 100 MHz clock with 10 ns period

  // Initial block to define the test sequence
  initial begin
    // Initialize signals
    clk = 0;
    clr = 0;
    pren = 0;
    data_in = 0;
    pr = 8'b0;
   
    // Test Case 1: Clear all flip-flops
    clr = 1; #10        // Activate clear
    clr = 0;     // Deactivate clear
   
    // Test Case 2: Parallel load data (pr = 10101010)
    #10 pr = 8'b10101010; pren = 1;  // Load parallel data
    #10 pren = 0;         // Disable parallel load

    // Test Case 3: Shift data serially (Shift 1's)
    #10 data_in = 1;      // Shift in 1
    #10 data_in = 0;      // Shift in 0

    // Test Case 4: Shift data serially (Shift 0's)
    #10 data_in = 0;      // Continue shifting in 0
    #20;

    // Test Case 5: Clear operation again
    #10 clr = 1;         // Clear the flip-flops
    #10 clr = 0;         // Release clear

    // Test Case 6: Shift random data
    #10 data_in = 1;      // Shift in random values
    #10 data_in = 0;
    #10 data_in = 1;

    // End of simulation
    #50 $finish;
  end
endmodule
