module vedic_multiplier(
    input [15:0] a,  
    input [15:0] b,
    output [31:0] product  
);

    wire [15:0] p0, p1, p2, p3;
    wire [31:0] z0, z1, z2, z3;

    wire [7:0] a0 = a[7:0];
    wire [7:0] a1 = a[15:8];
    wire [7:0] b0 = b[7:0];
    wire [7:0] b1 = b[15:8];

    vedic_8bit_multiplier U1 (.a(a0), .b(b0), .product(p0));
    vedic_8bit_multiplier U2 (.a(a1), .b(b0), .product(p1));
    vedic_8bit_multiplier U3 (.a(a0), .b(b1), .product(p2));
    vedic_8bit_multiplier U4 (.a(a1), .b(b1), .product(p3));  

    assign z0 = {16'b0, p0};           // z0 = p0
    assign z1 = {8'b0, p1, 8'b0};      // z1 = p1 shifted by 8 bits
    assign z2 = {8'b0, p2, 8'b0};      // z2 = p2 shifted by 8 bits
    assign z3 = {p3, 16'b0};           // z3 = p3 shifted by 16 bits

    assign product = z0+z1+z2+z3;

endmodule


module vedic_8bit_multiplier(
    input [7:0] a,
    input [7:0] b,
    output [15:0] product
);
    wire [7:0] p0, p1, p2, p3;
    wire [15:0] z0, z1, z2, z3;
   
    wire [3:0] a0 = a[3:0];
    wire [3:0] a1 = a[7:4];
    wire [3:0] b0 = b[3:0];
    wire [3:0] b1 = b[7:4];

    vedic_4bit_multiplier U1 (.a(a0), .b(b0), .product(p0));  
    vedic_4bit_multiplier U2 (.a(a1), .b(b0), .product(p1));  
    vedic_4bit_multiplier U3 (.a(a0), .b(b1), .product(p2));  
    vedic_4bit_multiplier U4 (.a(a1), .b(b1), .product(p3));  
   
    assign z0 = {8'b0, p0};           // z0 = p0
    assign z1 = {4'b0, p1, 4'b0};     // z1 = p1 shifted by 4 bits
    assign z2 = {4'b0, p2, 4'b0};     // z2 = p2 shifted by 4 bits
    assign z3 = {p3, 8'b0};           // z3 = p3 shifted by 8 bits

    assign product = z0+z1+z2+z3;

endmodule


module vedic_4bit_multiplier(
    input [3:0] a,
    input [3:0] b,
    output [7:0] product
);
    wire [3:0] p0, p1, p2, p3;
    wire [7:0] z0, z1, z2, z3;
 
    wire [1:0] a0 = a[1:0];
    wire [1:0] a1 = a[3:2];
    wire [1:0] b0 = b[1:0];
    wire [1:0] b1 = b[3:2];

    vedic_2bit_multiplier U1 (.a(a0), .b(b0), .product(p0));
    vedic_2bit_multiplier U2 (.a(a1), .b(b0), .product(p1));  
    vedic_2bit_multiplier U3 (.a(a0), .b(b1), .product(p2));  
    vedic_2bit_multiplier U4 (.a(a1), .b(b1), .product(p3));

    assign z0 = {4'b0, p0};           // z0 = p0
    assign z1 = {2'b0, p1, 2'b0};     // z1 = p1 shifted by 2 bits
    assign z2 = {2'b0, p2, 2'b0};     // z2 = p2 shifted by 2 bits
    assign z3 = {p3, 4'b0};           // z3 = p3 shifted by 4 bits
    assign product = z0+z1+z2+z3;

endmodule

module vedic_2bit_multiplier(
    input [1:0] a,
    input [1:0] b,
    output [3:0] product
);
    assign product = a * b;  
endmodule
