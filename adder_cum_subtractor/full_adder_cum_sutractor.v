//full_adder_cum_subtractor

module full_adder_cum_subtractor(
    input a,
    input b,
    input cin,
    input mode,
    output sumdiff,
    output cout
    );
    assign sumdiff = a^b^cin;
    assign cout = (b&cin)&((mode^a)&(cin+b));
   
endmodule
