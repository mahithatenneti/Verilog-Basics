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

module synchronous_updown (
    input clk,        // Clock input
    input rst,        // Reset input (active high)
    input up_down,    // Control signal: 1 for up, 0 for down
    output [3:0] Q    // 4-bit counter output
);

wire [3:0]D,Q_internal,Q_n;

    // Instantiate D flip-flops for each bit of the counter
    TFF dff0 (.T(1'b1), .clk(clk), .rst(rst), .Q(Q_internal[0]),.Qn(Q_n[0]));
    wire q1_and,q1_nand;
    and(q1_and,Q_internal[0],~up_down);
    and(q1_nand,Q_n[0],up_down);
    or(D[1],q1_nand,q1_and);
    TFF dff1 (.T(D[1]), .clk(clk), .rst(rst), .Q(Q_internal[1]),.Qn(Q_n[1]));
     wire q2_and,q2_nand;
     and(q2_and,q1_and,Q_internal[1]);
     and(q2_nand,q1_nand,Q_n[1]);
     or(D[2],q2_nand,q2_and);
    TFF dff2 (.T(D[2]), .clk(clk), .rst(rst), .Q(Q_internal[2]),.Qn(Q_n[2]));
    wire q3_and,q3_nand;
     and(q3_and,q2_and,Q_internal[2]);
     and(q3_nand,q2_nand,Q_n[2]);
     or(D[3],q3_nand,q3_and);
    TFF dff3 (.T(D[3]), .clk(clk), .rst(rst), .Q(Q_internal[3]),.Qn(Q_n[3]));

    // Output the current state of the counter
    assign Q = Q_internal;

endmodule
