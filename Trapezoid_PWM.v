module Trapezoid_PWM(
	CLK,PWMBP,D,L,CE,PWMOUT,ZERO
    );

input CLK;
input PWMBP;
input [7:0] D;
input L;
input CE;
output PWMOUT;
output ZERO;

reg [10:0] pwmd_reg;
reg [7:0] tw_reg;
reg pwmout_reg;
reg tw_up_reg = 1'b1;
reg [7:0] fl_reg;
reg tw7_reg;
reg tw7d_reg;
wire neq;
wire tw_en;
wire tw7_pos;
wire tw7en;
wire fl_en;

assign tw_en = CE & ~tw7en;
assign neq = (pwmd_reg[10:3]==tw_reg) ? 1'b0 : 1'b1;
assign PWMOUT = pwmout_reg;
assign ZERO = (tw_reg == 8'd0) ? 1'b1 : 1'b0;

always @(posedge CLK) begin
	if(PWMBP == 1'b1) 
		pwmd_reg <= 11'd0;
	else if (neq == 1'b1)
		pwmd_reg <= pwmd_reg + 1'b1;
end

always @(posedge CLK) begin
	if (L==1'b1) 
		tw_reg <= D;
	else if (tw_en == 1'b1) begin
		if (tw_up_reg==1'b1)
			tw_reg <= tw_reg + 1'b1;	
		else
			tw_reg <= tw_reg - 1'b1;
		end
	end
end

always @(posedge CLK) begin
	pwm_out_reg <= neq;
end

always @(posedge CLK) begin
	if(fl_reg[7]==1'b1)
		tw_up_reg <= 1'b0;
	else if (tw_reg == 8'd0)
		tw_up_reg <= 1'b1;
end

always @(posedge CLK) begin
	tw7_reg <= tw_reg[7];
end


endmodule
