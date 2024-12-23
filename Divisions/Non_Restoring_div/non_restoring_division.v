module non_restoring_division(
    input [3:0] Q,        // dividend
    input [4:0] M,        // divisor
    output reg [3:0] Q_out, // Q_out = Q / M
    output reg [4:0] rem    // remainder
    );
    
    integer i;
    reg [4:0] A;
    reg [3:0] Q_int;
    
    always @(Q or M) begin
        A = 5'b00000;
        Q_int = Q;
        
        for (i = 0; i < 4; i = i + 1) begin
            if (A[4] == 1'b0) begin   // Positive or zero
                A = {A[3:0], Q_int[3]} - M;
                Q_int = {Q_int[2:0], 1'b1};
            end else begin            // Negative
                A = {A[3:0], Q_int[3]} + M;
                Q_int = {Q_int[2:0], 1'b0};
            end
        end
        
        // Final correction if remainder is negative
        if (A[4] == 1'b1) begin
            A = A + M;
        end
        
        Q_out = Q_int-7;
        rem = A;
    end
endmodule
