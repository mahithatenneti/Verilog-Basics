module priority_encoder( input [3:0]I, output [1:0]O);
//Data Flow Modelling
assign O = (I[3]) ? 2'b11 : 
           (I[2]) ? 2'b10 : 
           (I[1]) ? 2'b01 : 
           (I[0]) ? 2'b00  : 2'b00;  //True false assignment need to be done at the last
//Behavioural Modelling
/*
always @(*)
begin
case (I)
4'b0001: O = 2'b00;
4'b001x: O = 2'b01;
4'b01xx: O = 2'b10;
4'b1xxx: O = 2'b11;
default: O = 2'bXX;
end*/
endmodule
