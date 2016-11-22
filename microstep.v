module microstep(
	CLK,SW,PSW0,PSW1,PSW2,MD_A,MD_B,MD_C,MD_D,LED0,LED1
    );

input CLK;
input [7:0] SW;
input PSW0;
input PSW1;
input PSW2;
output MD_A;
output MD_B;
output MD_C;
output MD_D;
output LED0;
output LED1;

reg [10:0] pwm_base_reg;
reg pwmbp_reg;
reg [7:0] rpa_reg;
reg [20:0] sampc_reg;
reg [7:0] sw_reg;
reg [7:0] swd_reg;
reg cyc_init_reg = 1'b0;
reg zero_a_reg;
reg zero_b_reg;
reg md_a_sel_reg;
reg md_b_sel_reg;

wire pwmbp;
wire chat_filter_dout;
wire rpeq;
wire rp;
wire pwmout_a;
wire pwmout_b;
wire zero_a;
wire zero_b;
wire zero_a_pos;
wire zero_b_pos;

assign pwmbp = pwm_base_reg[10];
assign zero_a_pos = zero_a & ~zero_a_reg;
assign zero_b_pos = zero_b & ~zero_b_reg;
assign rpeq = (rpq_reg == swd_reg) ? 1'b1 : 1'b0;
assign rp = (!swd_reg) ? rpeq : chat_filter_dout;

assign MD_A = ~(pwmout_a &          md_a_sel_reg )  & ~PSW1;
assign MD_B = ~(pwmout_a &         ~md_a_sel_reg )  & ~PSW1;
assign MD_C = ~(pwmout_b &  (PSW0 ^ md_b_sel_reg )) & ~PSW1;
assign MD_D = ~(pwmout_b & ~(PSW0 ^ md_b_sel_reg )) & ~PSW1;

assign LED0 = PSW0;
assign LED1 = PSW1;

chat_filter cf(.DIN(PSW2),
			   .CE(sampc_reg[20]),
			   .CLK(CLK),
			   .DOUT_ONE(chat_filter_dout));

Trapezoid_PWM PWM_A(
	.CLK(CLK),
	.PWMBP(pwmbp_reg),
	.D(8'd0),
	.L(1'b0),
	CE(rp),
	.PWMOUT(pwmout_a),
	.ZERO(zero_a));

Trapezoid_PWM PWM_B(
	.CLK(CLK),
	.PWMBP(pwmbp_reg),
	.D(8'h40),
	.L(~cyc_init_reg),
	CE(rp),
	.PWMOUT(pwmout_b),
	.ZERO(zero_b));

always @(posedge CLK) begin
	if(pwmbp==1'b1) 
		pwm_base_reg <= 11'd0;
	else 
		pwm_base_reg <= pwm_base_reg + 1'b1;
	end
end

always @(posedge CLK) begin
	if(rpeq == 1'b1)
		rpa_reg <= 8'd0;
	else if (pwmbp == 1'b1)
		rpq_reg <= rpq_reg + 1'b1;
end

always @(posedge CLK) begin
	if(sampc_reg[20] == 1'b1)
		sampc_reg <= 21'd0;
	else
	sampc_reg <= sampc_reg + 1'b1;
end


always @(posedge CLK) begin 
	sw_reg <= SW;
	swd_reg <= sw_reg;
end


always @(posedge CLK) begin
	cyc_init_reg <= 1'b1;
end


always @(posedge CLK) begin
	zero_a_reg <= zero_a;
	zero_b_reg <= zero_b;
end

always @(posedge CLK) begin
	if (zero_a_pos == 1'b1) 
		md_a_sel_reg <= ~md_a_sel_reg;
	if (zero_b_pos == 1'b1)
		md_b_sel_reg <= ~md_b_sel_reg;
end


endmodule
