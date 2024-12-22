module jhonson_counter(q,clk,clr);
  input clk,clr;
  output [3:0]q;
  reg [3:0]q;
  always @(posedge clk)
       if(clr==1)
            q<=4'b1000;
        else
            begin
                q[2:0]<=q[3:1];
                q[3]<= ~q[0];
            end
endmodule
