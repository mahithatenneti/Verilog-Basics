module t_flipflop(input T,input clk,output reg Q);
always @(posedge clk)
begin
Q<=0;
if(T)
 Q <= ~Q;
end 
endmodule 
