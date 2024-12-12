//Data flow Modelling
module decoder_2_4( input [1:0]I, output [3:0]O);
  assign O[0] = ~I[1] & ~I[0];
  assign O[1] = ~I[1] & I[0];
  assign O[2] =  I[1] & ~I[0];
  assign O[3] =  I[1] & I[0];
endmodule

//Gate level Modelling
/*
module decoder_2_4( input [1:0]I, output [3:0]O);
and (O[0],~I[1],~I[0]);
and (O[1],~I[1],I[0]);
and (O[2],I[1],~I[0]);
and (O[3],I[1],I[0]);
endmodule
*/


//behavioural Modelling
/*module decoder_2_4( input [1:0]I, output reg [3:0]O);
always @(*) 
begin
case(I)
2'b00: O = 4'b0001;
2'b01: O = 4'b0010;
2'b10: O = 4'b0100;
2'b11: O = 4'b1000;
default: O = 4'b0000;
endcase
end
endmodule*/
