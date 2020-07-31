module odev(input i0,i2,i3,i4,i5,i6,i7,i8,add1,add0,EN,WR,clk, output out1,out2,out3,out4,out5,out6,out7,out8);

wire  wa1,wa2,wa3,wa4,wa5,wa6,wa7,wa8,wb1,wb2,wb3,wb4,wb5,wb6,wb7,wb8,wc1,wc2,wc3,wc4,wc5,wc6,wc7,wc8,wd1,wd2,wd3,wd4,wd5,wd6,wd7,wd8;
wire  waa1,waa2,waa3,waa4,waa5,waa6,waa7,waa8,wbb1,wbb2,wbb3,wbb4,wbb5,wbb6,wbb7,wbb8,wcc1,wcc2,wcc3,wcc4,wcc5,wcc6,wcc7,wcc8,wdd1,wdd2,wdd3,wdd4,wdd5,wdd6,wdd7,wdd8;
wire  waaa1,waaa2,waaa3,waaa4,waaa5,waaa6,waaa7,waaa8,wbbb1,wbbb2,wbbb3,wbbb4,wbbb5,wbbb6,wbbb7,wbbb8,wccc1,wccc2,wccc3,wccc4,wccc5,wccc6,wccc7,wccc8,wddd1,wddd2,wddd3,wddd4,wddd5,wddd6,wddd7,wddd8;

wire clk1,clk2,clk3,clk4;
wire outa1,outa2,outa3,outa4,outa5,outa6,outa7,outa8;

assign clk1=(clk & ~add1 & ~add0);
assign clk2=(clk & ~add1 & add0);
assign clk3=(clk & add1 & ~add0);
assign clk4=(clk & add1 & add0);


demux   dmx1(wa1,wb1,wc1,wd1,add1,add0,i0);
demux   dmx2(wa2,wb2,wc2,wd2,add1,add0,i2);
demux   dmx3(wa3,wb3,wc3,wd3,add1,add0,i3);
demux   dmx4(wa4,wb4,wc4,wd4,add1,add0,i4);
demux   dmx5(wa5,wb5,wc5,wd5,add1,add0,i5);
demux   dmx6(wa6,wb6,wc6,wd6,add1,add0,i6);
demux   dmx7(wa7,wb7,wc7,wd7,add1,add0,i7);
demux   dmx8(wa8,wb8,wc8,wd8,add1,add0,i8);


my_muxa    muxa1(waa1,WR,wa1,waaa1);
my_muxa    muxa2(waa2,WR,wa2,waaa2);
my_muxa    muxa3(waa3,WR,wa3,waaa3);
my_muxa    muxa4(waa4,WR,wa4,waaa4);
my_muxa    muxa5(waa5,WR,wa5,waaa5);
my_muxa    muxa6(waa6,WR,wa6,waaa6);
my_muxa    muxa7(waa7,WR,wa7,waaa7);
my_muxa    muxa8(waa8,WR,wa8,waaa8);

my_muxa    muxb1(wbb1,WR,wb1,wbbb1);
my_muxa    muxb2(wbb2,WR,wb2,wbbb2);
my_muxa    muxb3(wbb3,WR,wb3,wbbb3);
my_muxa    muxb4(wbb4,WR,wb4,wbbb4);
my_muxa    muxb5(wbb5,WR,wb5,wbbb5);
my_muxa    muxb6(wbb6,WR,wb6,wbbb6);
my_muxa    muxb7(wbb7,WR,wb7,wbbb7);
my_muxa    muxb8(wbb8,WR,wb8,wbbb8);

my_muxa    muxc1(wcc1,WR,wc1,wccc1);
my_muxa    muxc2(wcc2,WR,wc2,wccc2);
my_muxa    muxc3(wcc3,WR,wc3,wccc3);
my_muxa    muxc4(wcc4,WR,wc4,wccc4);
my_muxa    muxc5(wcc5,WR,wc5,wccc5);
my_muxa    muxc6(wcc6,WR,wc6,wccc6);
my_muxa    muxc7(wcc7,WR,wc7,wccc7);
my_muxa    muxc8(wcc8,WR,wc8,wccc8);

my_muxa    muxd1(wdd1,WR,wd1,wddd1);
my_muxa    muxd2(wdd2,WR,wd2,wddd2);
my_muxa    muxd3(wdd3,WR,wd3,wddd3);
my_muxa    muxd4(wdd4,WR,wd4,wddd4);
my_muxa    muxd5(wdd5,WR,wd5,wddd5);
my_muxa    muxd6(wdd6,WR,wd6,wddd6);
my_muxa    muxd7(wdd7,WR,wd7,wddd7);
my_muxa    muxd8(wdd8,WR,wd8,wddd8);



dflipflop dffa1(waaa1,clk1,waa1);
dflipflop dffa2(waaa2,clk1,waa2);
dflipflop dffa3(waaa3,clk1,waa3);
dflipflop dffa4(waaa4,clk1,waa4);
dflipflop dffa5(waaa5,clk1,waa5);
dflipflop dffa6(waaa6,clk1,waa6);
dflipflop dffa7(waaa7,clk1,waa7);
dflipflop dffa8(waaa8,clk1,waa8);

dflipflop dffb1(wbbb1,clk2,wbb1);
dflipflop dffb2(wbbb2,clk2,wbb2);
dflipflop dffb3(wbbb3,clk2,wbb3);
dflipflop dffb4(wbbb4,clk2,wbb4);
dflipflop dffb5(wbbb5,clk2,wbb5);
dflipflop dffb6(wbbb6,clk2,wbb6);
dflipflop dffb7(wbbb7,clk2,wbb7);
dflipflop dffb8(wbbb8,clk2,wbb8);

dflipflop dffc1(wccc1,clk3,wcc1);
dflipflop dffc2(wccc2,clk3,wcc2);
dflipflop dffc3(wccc3,clk3,wcc3);
dflipflop dffc4(wccc4,clk3,wcc4);
dflipflop dffc5(wccc5,clk3,wcc5);
dflipflop dffc6(wccc6,clk3,wcc6);
dflipflop dffc7(wccc7,clk3,wcc7);
dflipflop dffc8(wccc8,clk3,wcc8);

dflipflop dffd1(wddd1,clk4,wdd1);
dflipflop dffd2(wddd2,clk4,wdd2);
dflipflop dffd3(wddd3,clk4,wdd3);
dflipflop dffd4(wddd4,clk4,wdd4);
dflipflop dffd5(wddd5,clk4,wdd5);
dflipflop dffd6(wddd6,clk4,wdd6);
dflipflop dffd7(wddd7,clk4,wdd7);
dflipflop dffd8(wddd8,clk4,wdd8);



my_muxb    mux1(outa1,add1,add0,waaa1,wbbb1,wccc1,wddd1);
my_muxb    mux2(outa2,add1,add0,waaa2,wbbb2,wccc2,wddd2);
my_muxb    mux3(outa3,add1,add0,waaa3,wbbb3,wccc3,wddd3);
my_muxb    mux4(outa4,add1,add0,waaa4,wbbb4,wccc4,wddd4);
my_muxb    mux5(outa5,add1,add0,waaa5,wbbb5,wccc5,wddd5);
my_muxb    mux6(outa6,add1,add0,waaa6,wbbb6,wccc6,wddd6);
my_muxb    mux7(outa7,add1,add0,waaa7,wbbb7,wccc7,wddd7);
my_muxb    mux8(outa8,add1,add0,waaa8,wbbb8,wccc8,wddd8);

assign out1=(outa1&EN);
assign out2=(outa2&EN);
assign out3=(outa3&EN);
assign out4=(outa4&EN);
assign out5=(outa5&EN);
assign out6=(outa6&EN);
assign out7=(outa7&EN);
assign out8=(outa8&EN);


endmodule



module demux(a1,b1,c1,d1,s1,s0,inpt);                                                                            

output a1,b1,c1,d1;
input inpt,s0,s1;

assign a1=(inpt & ~s0 & ~s1);
assign b1=(inpt & s0 & ~s1);
assign c1=(inpt & ~s0 & s1);
assign d1=(inpt & s0 & s1);

endmodule




module dflipflop(Q1,clock,D);

output Q1;
input clock,D;
wire wff1,wff2,wff3,wff4,wff5;

not n0(wff1,D);
nand n1(wff2,D,clock);
nand n2(wff3,wff1,clock);
nand n3(wff4,wff2,wff5);
nand n4(wff5,wff4,wff3);

assign Q1=(~wff5);

endmodule




module my_muxa(muxout,muxsw,muxinp0,muxinp1);

input muxsw,muxinp0,muxinp1;
output muxout;

assign muxout=((~muxsw & muxinp0) | (muxsw & muxinp1));

endmodule 




module my_muxb(muxoutb,muxsw1,muxsw0,inp0,inp1,inp2,inp3);

input muxsw1,muxsw0,inp0,inp1,inp2,inp3;
output muxoutb;

assign muxoutb=((~muxsw0 & ~muxsw1 & inp0)|(muxsw0 & ~muxsw1 & inp1)|(~muxsw0 & muxsw1 & inp2)|(muxsw0 & muxsw1 & inp3));

endmodule 