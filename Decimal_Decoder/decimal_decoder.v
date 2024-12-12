//Data flow Modelling

module decimal_decoder( input [2:0]I, output [7:0]O);
  assign O[0] = ~I[2] & ~I[1] & ~I[0];
  assign O[1] = ~I[2] & ~I[1] & I[0];
  assign O[2] = ~I[2] & I[1] & ~I[0];
  assign O[3] = ~I[2] & I[1] & I[0];
  assign O[4] = I[2] & ~I[1] & ~I[0];
  assign O[5] = I[2] & ~I[1] & I[0];
  assign O[6] = I[2] & I[1] & ~I[0];
  assign O[7] = I[2] & I[1] & I[0];
endmodule


//Gate level Modelling
/*
module decimal_decoder( input [2:0]I, output [7:0]O);
and (O[0],~I[2],~I[1],~I[0]);
and (O[1],~I[2],~I[1],I[0]);
and (O[2],~I[2],I[1],~I[0]);
and (O[3],~I[2],I[1],I[0]);
and (O[4],I[2],~I[1],~I[0]);
and (O[5],I[2],~I[1],I[0]);
and (O[6],I[2],I[1],~I[0]);
and (O[7],I[2],I[1],I[0]);
endmodule
*/

//behavioural Modelling
/*
module decimal_decoder( input [2:0]I, output [7:0]O);
always @(*) 
begin
case(I)
3'b000: O = 8'b00000001;
3'b001: O = 8'b00000010;
3'b010: O = 8'b00000100;
3'b011: O = 8'b00001000;
3'b100: O = 8'b00010000;
3'b101: O = 8'b00100000;
3'b110: O = 8'b01000000;
3'b111: O = 8'b10000000;

default: O =8'b0000;
endcase
end
endmodule
*/
