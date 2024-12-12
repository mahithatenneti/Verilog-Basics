module mux_4x1(input [3:0]In, input [1:0]Select, output out);

//assign out = (~Select[1] & ~Select[0] & In[0]) | (~Select[1] & Select[0] & In[1]) | (Select[1] & ~Select[0] & In[2]) | (Select[1] & Select[0] & In[3]);
assign out = (Select == 2'b00) ? In[0]: 
             (Select == 2'b01) ? In[1]: 
             (Select == 2'b10) ? In[2]:  In[3] ;
endmodule
