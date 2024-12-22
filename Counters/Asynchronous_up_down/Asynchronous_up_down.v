module mux2to1(input a,b,up_down, output c);
wire up_down_not,X1,X2;
  not(up_down_not,up_down);
  and(X1,a,up_down_not);
  and(X2,b,up_down);
  or(c,X1,X2);
endmodule

module D_flipflop( input d,clk,clear, output q,qbar);
wire s,sbar,r,rbar,cbar,clk_not;
  not(cbar,clear);
  not(clk_not,clk);
  nand(sbar,rbar,s);
  nand(s,sbar,cbar,clk_not);
  nand(r,rbar,clk_not,s);
  nand(rbar,r,cbar,d);
  nand(q,s,qbar);
  nand(qbar,q,r,cbar);
endmodule

module TFF (input  T,  input clk, input rst, output  Q, output Qn);
wire D;
xor(D,T,Q); // D = T XOR Q
D_flipflop uut ( .d(D),.clk(clk),.clear(rst),.q(Q),.qbar(Qn));
endmodule

module asynchronous_updown(
    input clk,      // Clock signal
    input clear,
    input up_down,    // Asynchronous reset (active low) and up_down counter
    output [3:0] q // 4-bit counter output
    );
    // Declare wires to connect the flip-flops
    wire t0, t1, t2, t3;
    wire clk_1,clk_2,clk_3;
    wire [3:0] qbar;
    // The first flip-flop always toggles, so T is always 1
    assign t0 = 1'b1;  
    assign t1 = 1'b1;//q[0];  
    assign t2 = 1'b1;
    assign t3 = 1'b1;
    // Instantiate T flip-flops (structural modeling)
    TFF  tff0 (.clk(clk),.rst(clear), .T(t0), .Q(q[0]),.Qn(qbar[0]));
    mux2to1 mux1(.a(q[0]),.b(qbar[0]),.up_down(up_down),.c(clk_1));
    TFF  tff1 (.clk(clk_1),.rst(clear), .T(t1), .Q(q[1]),.Qn(qbar[1]));
    mux2to1 mux2(.a(q[1]),.b(qbar[1]),.up_down(up_down),.c(clk_2));
    TFF  tff2 (.clk(clk_2),.rst(clear), .T(t2), .Q(q[2]),.Qn(qbar[2]));
    mux2to1 mux3(.a(q[2]),.b(qbar[2]),.up_down(up_down),.c(clk_3));
    TFF  tff3 (.clk(clk_3),.rst(clear), .T(t3), .Q(q[3]),.Qn(qbar[3]));

endmodule
