module ii_4(clk, count, reset, c0, c1, c2, c3);
	input clk, count, reset;
	output reg c0, c1, c2, c3;

	wire calc_c0, calc_c1, calc_c2, calc_c3;
	assign calc_c0 = (count & ~c0) | (~count & c0);
	assign calc_c1 =
		((count & c0) & ~c1) |
		((~count | ~c0) & c1);
	assign calc_c2 =
		((count & c0 & c1) & ~c2) |
		((~count | ~c0 | ~c1) & c2);
	assign calc_c3 =
		((count & c0 & c1 & c2) & ~c3) |
		((~count | ~c0 | ~c1 | ~c2) & c3);

	wire reset_by_limit;
	assign reset_by_limit = c0 & ~c1 & c2 & c3;
	wire reset_final;
	assign reset_final = reset | reset_by_limit;

	wire next_c0, next_c1, next_c2, next_c3;
	assign next_c0 = calc_c0 & ~reset_final;
	assign next_c1 = calc_c1 & ~reset_final;
	assign next_c2 = calc_c2 & ~reset_final;
	assign next_c3 = calc_c3 & ~reset_final;

	always @(posedge clk) begin
		c0 <= next_c0;
		c1 <= next_c1;
		c2 <= next_c2;
		c3 <= next_c3;
	end

	initial begin
		c0 = 0; c1 = 0; c2 = 0; c3 = 0;
	end
endmodule
