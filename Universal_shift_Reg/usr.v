module dff(q,qbar,clk,reset,d,pr);
input d,clk,reset,pr;
output q,qbar;

wire s,sbar,r,rbar,resetbar,clkbar;
not(resetbar,reset);
not(clkbar,clk);
nand(sbar,rbar,s);
nand(s,sbar,resetbar,clkbar);
nand(r,rbar,clkbar,s);
nand(rbar,r,resetbar,d);
//ouptut latch
nand(q,s,qbar,pr);
nand(qbar,q,r,resetbar);
endmodule

module usr(clk, clr, pr, pren, data_in, data_out, q);
  input clk, clr, pren, data_in;
  input [7:0] pr;         // Parallel input data
  output data_out;       // Serial output
  output [7:0] q;        // Parallel output
 
  wire w1, w2, w3, w4, w5, w6, w7, w8;

  // Instantiate 8 D flip-flops for the shift register
  dff dff7(q[7], w1, clk, clr, data_in, ~(pren & pr[7]));
  dff dff6(q[6], w2, clk, clr, q[7], ~(pren & pr[6]));
  dff dff5(q[5], w3, clk, clr, q[6], ~(pren & pr[5]));
  dff dff4(q[4], w4, clk, clr, q[5], ~(pren & pr[4]));
  dff dff3(q[3], w5, clk, clr, q[4], ~(pren & pr[3]));
  dff dff2(q[2], w6, clk, clr, q[3], ~(pren & pr[2]));
  dff dff1(q[1], w7, clk, clr, q[2], ~(pren & pr[1]));
  dff dff0(q[0], w8, clk, clr, q[1], ~(pren & pr[0]));
 
  // Connect serial data output directly from q[0]
buf b1(data_out, q[0]); // Use a buffer to drive the serial output
endmodule


