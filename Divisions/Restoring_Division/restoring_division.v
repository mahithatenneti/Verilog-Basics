module restoring_division (
    input [7:0] dividend,      // 8-bit Dividend
    input [7:0] divisor,       // 8-bit Divisor
    output reg [7:0] quotient, // 8-bit Quotient
    output reg [7:0] remainder // 8-bit Remainder
);

    reg [15:0] acc_dividend;    // 16-bit Accumulator to hold remainder and dividend
    integer i;                  // Loop counter

    always @(dividend or divisor) begin
        // Initialize
        quotient = 0;
        acc_dividend = {8'b0, dividend}; // Initialize the accumulator with the dividend in lower 8 bits

        // Division process
        for (i = 7; i >= 0; i = i - 1) begin
            // Left shift acc_dividend (shift entire 16-bit register left by 1)
            acc_dividend = acc_dividend << 1;

            // Subtract divisor from the high 8 bits of acc_dividend
            acc_dividend[15:8] = acc_dividend[15:8] - divisor;

            if (acc_dividend[15]) begin
                // If the result is negative, restore previous value
                acc_dividend[15:8] = acc_dividend[15:8] + divisor;
                quotient[i] = 0; // Set the quotient bit to 0
            end else begin
                // If the result is positive or zero, set the quotient bit to 1
                quotient[i] = 1;
            end
        end

        // Set the remainder to the upper 8 bits of acc_dividend
        remainder = acc_dividend[15:8];
    end

endmodule
