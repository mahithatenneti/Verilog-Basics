module encoder( input [3:0]I, output [1:0]O);
//Data flow Modelling
  assign O[0] = I[1] | I[3];
  assign O[1] = I[2] | I[3];
//Gate level Modelling
/*or (O[0],I[1],I[3]);
or (O[1],I[2],I[3]);*/
endmodule
//behavioural Modelling
/*module encoder( input [3:0]I, output reg [1:0]O);
always @(*) 
begin
case(I)
4'b0001: O = 2'b00;
4'b0010: O = 2'b01;
4'b0100: O = 2'b10;
4'b1000: O = 2'b11;
default: O = 2'bXX;
endcase
end
endmodule*/
