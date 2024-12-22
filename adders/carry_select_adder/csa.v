//MUX2x1
module mux2x1(y,s,i1,i0);
input i1,i0;
input s;
output y;
wire w1,y0,y1;
not g1(w1,s);
and g2(y0,w1,i0);
and g3(y1,s,i1);
or g4(y,y0,y1);
endmodule
//FullAdder
module fa(cy,s,a,b,c);
input a,b,c;
output s,cy;
wire w1,w2,w3;
xor g1(s,a,b,c);
and g2(w1,a,b);
and g3(w2,b,c);
and g4(w3,a,c);
or  g5(cy,w1,w2,w3);
endmodule
//RCA
module rca(cout,s,a,b,cin);
output [3:0]s;
output cout;
input [3:0]a,b;
input cin;
wire w1,w2,w3;
fa fa1(w1,s[0],a[0],b[0],cin);
fa fa2(w2,s[1],a[1],b[1],w1);
fa fa3(w3,s[2],a[2],b[2],w2);
fa fa4(cout,s[3],a[3],b[3],w3);
endmodule
//CSA
module csa(cy,s,a,b,cin);
input [7:0]a,b;
input cin;
output [7:0]s;
output cy;
wire [13:0]w;
assign w[2]=1'b0;
assign w[3]=1'b1;
rca rca1(w[0],s[3:0],a[3:0],b[3:0],cin);
mux2x1 m1(w[1],w[0],w[2],w[3]);
rca rca2(w[12],w[7:4],a[7:4],b[7:4],w[2]);
rca rca3(w[13],w[11:8],a[7:4],b[7:4],w[3]);
mux2x1 m2(s[4],w[0],w[8],w[4]);
mux2x1 m3(s[5],w[0],w[9],w[5]);
mux2x1 m4(s[6],w[0],w[10],w[6]);
mux2x1 m5(s[7],w[0],w[11],w[7]);
mux2x1 m6(cy,w[0],w[12],w[13]);
endmodule
