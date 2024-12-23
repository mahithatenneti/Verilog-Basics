module tb_restoring_division;
    reg [7:0] dividend;      // 8-bit Dividend
    reg [7:0] divisor;       // 8-bit Divisor
    wire [7:0] quotient;     // 8-bit Quotient
    wire [7:0] remainder;    // 8-bit Remainder

    // Instantiate the restoring_division module
    restoring_division uut (
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .remainder(remainder)
    );

    initial begin
        // Test case 1: 42 / 5
        dividend = 8'd42;
        divisor = 8'd5;
        #10;
 
         // Test case 2: 00 / 150
        dividend = 8'd00;
        divisor = 8'd150;
        #10;
      
        // Test case 3: 54 / 6
        dividend = 8'd54;
        divisor = 8'd6;
        #10;

        // Test case 4: 123 / 11
        dividend = 8'd123;
        divisor = 8'd11;
        #10;

        // Test case 5: 255 / 70
        dividend = 8'd255;
        divisor = 8'd7;
        #10;

        // Test case 6: Edge case: Dividend = 0
        dividend = 8'd0;
        divisor = 8'd10;
        #10;


        // Test case 7: Edge case: Divisor = 1
        dividend = 8'd100;
        divisor = 8'd100;
        #10;

        // Test case 8: Dividend and divisor are equal
        dividend = 8'd50;
        divisor = 8'd25;
        #10;


        $finish;
    end
endmodule
