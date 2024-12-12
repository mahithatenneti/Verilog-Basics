module testbench;
reg a,b,cin,mode;
wire sumdiff,cout;
full_adder_cum_subtractor uut(.a(a),.b(b),.cin(cin),.mode(mode),.sumdiff(sumdiff),.cout(cout));

// Test Procedure
    initial begin
        a=0;b=0;cin=0;mode=0;#10;
        a=0;b=0;cin=1;mode=0;#10;
        a=0;b=1;cin=0;mode=0;#10;
        a=0;b=1;cin=1;mode=0;#10;
        a=1;b=0;cin=0;mode=0;#10;
        a=1;b=0;cin=1;mode=0;#10;
        a=1;b=1;cin=0;mode=0;#10;
        a=1;b=1;cin=1;mode=0;#10;
       
        a=0;b=0;cin=0;mode=1;#10;
        a=0;b=0;cin=1;mode=1;#10;
        a=0;b=1;cin=0;mode=1;#10;
        a=0;b=1;cin=1;mode=1;#10;
        a=1;b=0;cin=0;mode=1;#10;
        a=1;b=0;cin=1;mode=1;#10;
        a=1;b=1;cin=0;mode=1;#10;
        a=1;b=1;cin=1;mode=1;#10;
 $finish;      
end
endmodule
