module pwm(
	CLK,RST,SW,MD1,MD2
    );

input CLK;
input RST;
input [7:0] SW;
output MD1;
output MD2;

reg [7:0] sw_reg_1d; // equal to SW
reg [7:0] sw_reg_2d; // equal to SW
reg [10:0] pwm_base_reg; // up to 1024
reg [10:0] pwm_duty_reg; // up to SW
reg pwm_out_reg; // 0 or 1 (output)

wire pwmbp; // if-condition flag
wire pwm_out; // if-condition flag

assign pwmbp = pwm_base_reg[10];
// assign pwm_out = (pwm_duty_reg[10:3] == sw_reg_2d) ? 1'b0 : 1'b1;
assign pwm_out = (pwm_duty_reg>>2 == sw_reg_2d) ? 1'b0 : 1'b1;
assign MD1 = pwm_out_reg;
assign MD2 = 1'b1;

always @(posedge CLK) begin
	sw_reg_1d <= SW;
	sw_reg_2d <= sw_reg_1d;
end

always @(posedge CLK) begin
	if(pwmbp == 1'b1) 
		pwm_base_reg <= 11'd0;
	else if(RST)
		pwm_base_reg <= 11'd0;
	else 
		pwm_base_reg <= pwm_base_reg + 1'b1;
end

always @(posedge CLK) begin
	if(pwmbp == 1'b1) 
		pwm_duty_reg <= 11'd0;
	else if(RST)
		pwm_duty_reg <= 11'd0;
	else if(pwm_out==1'b1)  
		pwm_duty_reg <= pwm_duty_reg + 1'b1;
end


always @(posedge CLK) begin
	pwm_out_reg <= pwm_out;
end


endmodule
