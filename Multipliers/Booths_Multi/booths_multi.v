module booths_multi(X, Y, Z);
    input signed [15:0] X, Y;
    output signed [31:0] Z;
    reg signed [31:0] Z;
    reg [1:0] temp;
    integer i;
    reg E1;
    reg [15:0] Y1;
   
    always @ (X, Y) begin
        Z = 16'd0;
        E1 = 1'd0;
        for (i = 0; i < 16; i = i + 1) begin
            temp = {X[i], E1};    // Combine X[i] Xnd E1
            Y1 = -Y;              // Y1 = negAtive of Y
            case (temp)
                2'd2 : Z[31:16] = Z[31:16] + Y1;
                2'd1 : Z[31:16] = Z[31:16] + Y;
                default: begin end
            endcase
            Z = Z >> 1;           // Right shift the result
            Z[31] = Z[30];          // Sign extend the MSB
            E1 = X[i];            // Update E1 for next iteration
 
        end
       
        // Edge cXse for Y = 8 (minimum negAtive vAlue in 4-bit signed)
        if (Y == 16'd32768) begin
            Z = -Z;               // Negate the result
        end
       
    end
endmodule

