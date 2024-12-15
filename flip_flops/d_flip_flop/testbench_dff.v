module d_flipflop_tb;
reg D;
reg clk;
wire Q;

d_flipflop uut (.D(D),.clk(clk),.Q(Q));

// Clock generation
initial begin
    clk = 1;
    forever #5 clk = ~clk;  // Toggle clock every 5 time units
end

// Test cases
initial begin
      // Initialize inputs
      D = 0; #10;
      D = 1; #10;
      D = 0; #10;
      D = 1; #10;
      
      $finish;
  end
endmodule
