module multiplier(input mc0,mc1,mc2,mc3,ml0,ml1,start,clock, output out1,out2,out3,out4,out5,out6);

wire wcout1,wcout2,wcout3,wcout4,wcout5,wcout6,clk1,wmc0,wmc1,wmc2,wmc3,wclock,wcount0,wcount1,wcountstop0,wcountstop1,wcontinue;


assign wclock=(clock&wcontinue);


xor xora(wcountstop0,wcount0,ml0);
xor xorb(wcountstop1,wcount1,ml1);
or  ora(wcontinue,wcountstop0,wcountstop1);

adder_with_memory    awmcounter0(wcount0,wcout5,1,wclock,0);
adder_with_memory    awmcounter1(wcount1,wcout6,0,wclock,wcout5);


my_muxa  mux1(wmc0,start,0,mc0);
my_muxa  mux2(wmc1,start,0,mc1);
my_muxa  mux3(wmc2,start,0,mc2);
my_muxa  mux4(wmc3,start,0,mc3);


adder_with_memory    awm1(out1,wcout1,wmc0,wclock,0);
adder_with_memory    awm2(out2,wcout2,wmc1,wclock,wcout1);
adder_with_memory    awm3(out3,wcout3,wmc2,wclock,wcout2);
adder_with_memory    awm4(out4,wcout4,wmc3,wclock,wcout3);
adder_with_memory    awm5(out5,out6,wcout4,wclock,0);



endmodule


 

module adder_with_memory(s,cout,inp1,clk,cin);

input inp1,clk,cin;
output s,cout;
wire add1,add2,add3,adds,dff1,dff2,dff3,dff4,dff5;

and a1(add1,inp1,dff4);
xor a2(add2,inp1,dff4);
and a3(add3,add2,cin);
xor a4(adds,add2,cin);
or  a5(cout,add1,add3);

not n0(dff1,adds);
nand n1(dff2,adds,clk);
nand n2(dff3,dff1,clk);
nand n3(dff4,dff2,dff5);
nand n4(dff5,dff4,dff3);

assign s=(~dff5); 

endmodule 



module my_muxa(muxout,muxsw,muxinp0,muxinp1);

input muxsw,muxinp0,muxinp1;
output muxout;

assign muxout=((~muxsw & muxinp0) | (muxsw & muxinp1));

endmodule






/*module dflipflop(Q1,clk,D);

output Q1;
input clk,D;
wire wff1,wff2,wff3,wff4,wff5;

not n0(wff1,D);
nand n1(wff2,D,clock);
nand n2(wff3,wff1,clock);
nand n3(wff4,wff2,wff5);
nand n4(wff5,wff4,wff3);

assign Q1=(~wff5);

endmodule 



module fulladder(s,cout,inp1,inp2,cin);

input inp1,inp2,cin;
output s,cout;
wire add1,add2,add3,adds,dff1,dff2,dff3,dff4,dff5;

and a1(add1,inp1,inp2);
xor a2(add2,inp1,inp2);
and a3(add3,add2,cin);
xor a4(adds,add2,cin);
or  a5(cout,add1,add3);

endmodule*/


//wire wq1,wq2,wq3,wq4,wfa1,wfa2,wfa3,wfa4,wfa5,wffa1,wffa2,wffa3,wffa4,wffa5;



/*dflipflop      df1(wq1,clock,wfa1);
fulladder      fa1(wffa1,wcout1,wmc1,wq1,0);

dflipflop      df2(wq2,clock,wfa2);
fulladder      fa2(wffa2,wcout2,wmc2,wq2,wcout1);

dflipflop      df3(wq3,clock,wfa3);
fulladder      fa3(wffa3,wcout3,wmc3,wq3,wcout2);


dflipflop      df4(wq4,clock,wfa4);
fulladder      fa4(wffa4,wcout4,wmc4,wq4,wcout3);
*/
/*

assign wffa1=(wfa1|0);
assign wffa2=(wfa2|0);
assign wffa3=(wfa3|0);
assign wffa4=(wfa4|0);
assign wffa5=(wfa5|0);
*/