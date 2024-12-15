module jk_flipflop(input J,input K,input clk,output reg Q,output reg Qbar);
always @(posedge clk)
begin
if(J==1 && K==1)
begin
 Q <= ~Q;
 Qbar <= ~Qbar;
end 
else if(J==0 && K==1)
begin
 Q <= 0;
 Qbar <= 1;
end
else if(J==1 && K==0)
begin
 Q <= 1;
 Qbar <= 0;
end
end
endmodule 
