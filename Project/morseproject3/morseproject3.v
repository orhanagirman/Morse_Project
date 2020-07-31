module morseproject3(in,H,clock,reset_all,lcd_on,lcd_rs,lcd_rw,lcd_en,counter_out0,counter_out1,outb,register,d77,d66,d55,d44,d33,d22,d11,d00);


input in,H,clock,reset_all;
output [29:0] counter_out0,counter_out1;
output [1:0] outb;
output [9:0] register;
output d77,d66,d55,d44,d33,d22,d11,d00,lcd_on,lcd_rs,lcd_rw,lcd_en;

reg d77,d66,d55,d44,d33,d22,d11,d00,lcd_rs,lcd_rw,lcd_en;
reg[1:0] outb;
reg[0:0] reset_0;
reg[0:0] enable_0;
reg[0:0] reset_1;
reg[0:0] enable_1;
reg[9:0] register=0;

reg [24:0] constant0 =25'b01;//25'b1011111010111100001000000;
reg [25:0] constant1 =26'b1000;//26'b10111110101111000010000000;
reg [22:0] constant2 =23'b10;//23'b10011000100101101000000;
integer i=1;
integer control=0;
assign lcd_on=1;		 	 
decoder lcd(1,register[9],register[8],register[7],register[6],register[5],register[4],register[3],register[2],register[1],register[0],d777,d666,d555,d444,d333,d222,d111,d000);

counter zero(clock,reset_0,enable_0,counter_out0);
counter one(clock,reset_1,enable_1,counter_out1);
always @ (posedge clock)

if (in==0) begin

      reset_0=0;
		enable_0=1;
	if (reset_all) begin
		  
		 register[9]<=0;
		 register[8]<=0;
		 register[7]<=0;
		 register[6]<=0;
		 register[5]<=0;
		 register[4]<=0;
		 register[3]<=0;
		 register[2]<=0;
		 register[1]<=0;
		 register[0]<=0;
	    
	
	end
	  
	if (H==1) begin
	
       lcd_rs=1;
		 lcd_rw=0;
		 lcd_en=1; 
	    d77=d777;
		 d66=d666;
		 d55=d555;
		 d44=d444;
		 d33=d333;
		 d22=d222;
		 d11=d111;
		 d00=d000;
		 lcd_en=0;
		 control=0;
      
		 
	end
	
   if (counter_out0 >= constant0 ) begin
	
		 
       if((outb[0] == 1 || outb[0] == 0) && outb[1] == 1) begin
		    
			 while(i) begin
                if(control!=5) begin
			    
                   register[9]<=register[7];
			          register[8]<=register[6];
			          register[7]<=register[5];
			          register[6]<=register[4];
			          register[5]<=register[3];
			          register[4]<=register[2];
			          register[3]<=register[1];
			          register[2]<=register[0];
			          register[0]<=outb[0];
			          register[1]<=outb[1]; 
						 control=control+1;
						 end
						 i=0;
			 end
		 
		 
		 end
		 
		 
		 reset_1=1;
		 enable_1=0;
		 
       
	end else begin
       reset_1=0;
		 enable_1=0;
	end	 

end

else if (in==1'b1) begin

     reset_0=1;
	  enable_0=0;
	  reset_1=0;
	  enable_1=1;
     i=1;
	  
	  
	 if(H==1) begin

	 
	 end else if(H==0) begin
	 
	      if(counter_out1 <= constant1 && counter_out1 >= constant2) begin
	 
	         outb<= #1 2'b10;
		 
	      end else if (counter_out1>constant1) begin
	 
	         outb<= #1 2'b11;
		  
	      end else begin
        
		      outb<= #1 2'b00;
	      end	   
	 
	 
	 end
  

end


endmodule

module counter(clock,reset,enable,counter_out);


input clock;
input reset;
input enable;

output [29:0] counter_out;

wire clock ;
wire reset ;
wire enable ;

reg [29:0] counter_out ;



always @ (posedge clock)

begin : COUNTER

if (reset == 1'b1) begin
counter_out <= #1 4'b0000;
end

else if (enable == 1'b1) begin
counter_out <= #1 counter_out + 1;
end
end 

endmodule 


module decoder(H,register0[9],register0[8],register0[7],register0[6],register0[5],register0[4],register0[3],register0[2],register0[1],register0[0],d7,d6,d5,d4,d3,d2,d1,d0);

input H;
input [9:0] register0;
output d7,d6,d5,d4,d3,d2,d1,d0;

assign d7 = 0;
assign d6 = (H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&~register0[5]&~register0[4]&~register0[2]&register0[1])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&~register0[4]&register0[3]&register0[1])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&register0[5]&register0[3]&register0[1])|(H&~register0[9]&~register0[8]&~register0[6]&register0[5]&register0[4]&register0[3]&register0[2]&register0[1])|(H&~register0[9]&~register0[8]&register0[7]&register0[6]&register0[5]&~register0[4]&register0[3]&register0[1])|(H&~register0[9]&~register0[8]&register0[7]&register0[6]&register0[5]&register0[3]&~register0[2]&register0[1])|(H&~register0[9]&~register0[8]&~register0[6]&register0[5]&~register0[4]&register0[3]&~register0[2]&register0[1])|(H&~register0[9]&~register0[8]&~register0[6]&register0[5]&register0[3]&register0[1]&~register0[0]);
assign d5 = (H&register0[9]&~register0[8]&register0[7]&~register0[6]&register0[5]&~register0[4]&register0[3]&~register0[2]&register0[1])|(H&register0[9]&~register0[8]&register0[7]&~register0[6]&register0[5]&register0[3]&register0[2]&register0[1]&register0[0])|(H&register0[9]&register0[7]&register0[6]&register0[5]&register0[4]&register0[3]&register0[2]&register0[1]&register0[0])|(H&register0[9]&register0[8]&register0[7]&register0[5]&~register0[4]&register0[3]&~register0[2]&register0[1]&~register0[0])|(H&register0[9]&register0[8]&register0[7]&register0[6]&register0[5]&register0[4]&register0[3]&register0[1]&~register0[0]);
assign d4 = (H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&~register0[5]&~register0[4]&~register0[3]&~register0[2]&register0[1]&register0[0])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&register0[5]&~register0[4]&register0[3]&register0[1])|(H&~register0[9]&~register0[8]&register0[7]&~register0[6]&register0[5]&register0[4]&register0[3]&register0[2]&register0[1]&~register0[0])|(H&~register0[9]&~register0[8]&register0[7]&register0[6]&register0[5]&~register0[4]&register0[3]&register0[1]&register0[0])|(H&~register0[9]&~register0[8]&register0[7]&register0[6]&register0[5]&register0[4]&register0[3]&~register0[2]&register0[1])|(H&~register0[9]&~register0[8]&~register0[6]&register0[5]&~register0[4]&register0[3]&~register0[2]&register0[1]&register0[0])|(H&register0[9]&~register0[8]&register0[7]&~register0[6]&register0[5]&~register0[4]&register0[3]&~register0[2]&register0[1])|(H&register0[9]&~register0[8]&register0[7]&~register0[6]&register0[5]&register0[3]&register0[2]&register0[1]&register0[0])|(H&register0[9]&register0[7]&register0[6]&register0[5]&register0[4]&register0[3]&register0[2]&register0[1]&register0[0])|(H&register0[9]&register0[8]&register0[7]&register0[5]&~register0[4]&register0[3]&~register0[2]&register0[1]&~register0[0])|(H&register0[9]&register0[8]&register0[7]&register0[6]&register0[5]&register0[4]&register0[3]&register0[1]&~register0[0]);
assign d3 = (H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&~register0[5]&~register0[4]&register0[3]&register0[1]&~register0[0])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&~register0[5]&~register0[4]&register0[3]&register0[2]&register0[1])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&register0[5]&register0[4]&register0[3]&register0[1]&register0[0])|(H&~register0[9]&~register0[8]&~register0[6]&register0[5]&register0[4]&register0[3]&register0[2]&register0[1]&register0[0])|(H&~register0[9]&~register0[8]&register0[7]&~register0[6]&register0[5]&register0[3]&~register0[2]&register0[1]&~register0[0])|(H&~register0[9]&~register0[8]&register0[7]&register0[5]&register0[4]&register0[3]&~register0[2]&register0[1]&~register0[0])|(H&~register0[9]&~register0[8]&register0[7]&register0[6]&register0[5]&~register0[4]&register0[3]&register0[1]&register0[0])|(H&register0[9]&register0[8]&register0[7]&register0[6]&register0[5]&register0[4]&register0[3]&register0[1]&~register0[0]);
assign d2 = (H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&~register0[5]&~register0[4]&~register0[3]&~register0[2]&register0[1])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&~register0[5]&~register0[4]&register0[3]&register0[2]&register0[1])|(H&~register0[9]&~register0[8]&~register0[6]&register0[5]&register0[4]&register0[3]&~register0[2]&register0[1]&~register0[0])|(H&~register0[9]&~register0[8]&register0[7]&~register0[6]&register0[5]&~register0[4]&register0[3]&register0[2]&register0[1]&~register0[0])|(H&register0[9]&register0[8]&register0[7]&register0[5]&~register0[4]&register0[3]&~register0[2]&register0[1]&~register0[0])|(H&~register0[9]&~register0[8]&~register0[6]&register0[5]&~register0[4]&register0[3]&~register0[2]&register0[1]&register0[0])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&register0[5]&register0[3]&register0[2]&register0[1]&register0[0])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&register0[5]&register0[4]&register0[3]&register0[1]&~register0[0])|(H&register0[9]&~register0[8]&register0[7]&~register0[6]&register0[5]&~register0[4]&register0[3]&~register0[2]&register0[1]);
assign d1 = (H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&~register0[4]&register0[3]&register0[2]&register0[1]&~register0[0])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&register0[5]&~register0[4]&register0[3]&register0[1]&~register0[0])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&register0[5]&register0[3]&register0[2]&register0[1])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&register0[5]&register0[4]&register0[3]&register0[1]&register0[0])|(H&~register0[9]&~register0[8]&register0[7]&~register0[6]&register0[5]&~register0[4]&register0[3]&~register0[2]&register0[1]&register0[0])|(H&~register0[9]&~register0[8]&register0[7]&register0[6]&register0[5]&register0[3]&~register0[2]&register0[1]&~register0[0])|(H&register0[9]&~register0[8]&register0[7]&~register0[6]&register0[5]&register0[3]&register0[2]&register0[1]&register0[0])|(H&register0[9]&register0[8]&register0[7]&register0[5]&~register0[4]&register0[3]&~register0[2]&register0[1]&~register0[0])|(H&~register0[9]&~register0[8]&~register0[6]&register0[5]&register0[4]&register0[3]&register0[2]&register0[1]&register0[0])|(H&~register0[9]&~register0[8]&register0[7]&register0[5]&~register0[4]&register0[3]&register0[2]&register0[1]&~register0[0]);
assign d0 = (H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&~register0[5]&~register0[4]&~register0[2]&register0[1]&~register0[0])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&~register0[4]&register0[3]&~register0[2]&register0[1])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&~register0[4]&register0[3]&register0[1]&register0[0])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&register0[5]&register0[3]&register0[1]&register0[0])|(H&~register0[9]&~register0[8]&~register0[7]&~register0[6]&register0[5]&register0[4]&register0[3]&register0[2]&register0[1])|(H&~register0[9]&~register0[8]&register0[7]&register0[6]&register0[5]&~register0[4]&register0[3]&register0[2]&register0[1])|(H&~register0[9]&~register0[8]&register0[7]&register0[6]&register0[5]&register0[4]&register0[3]&~register0[2]&register0[1]&register0[0])|(H&register0[9]&~register0[8]&register0[7]&~register0[6]&register0[5]&~register0[4]&register0[3]&~register0[2]&register0[1]&~register0[0])|(H&register0[9]&~register0[8]&register0[7]&~register0[6]&register0[5]&~register0[4]&register0[3]&register0[2]&register0[1]&register0[0])|(H&register0[9]&~register0[8]&register0[7]&register0[6]&register0[5]&register0[4]&register0[3]&register0[2]&register0[1]&register0[0])|(H&register0[9]&register0[8]&register0[7]&register0[6]&register0[5]&~register0[4]&register0[3]&~register0[2]&register0[1]&~register0[0])|(H&register0[9]&register0[8]&register0[7]&register0[6]&register0[5]&register0[4]&register0[3]&register0[2]&register0[1]&~register0[0]);



endmodule
