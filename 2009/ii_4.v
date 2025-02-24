module ii_4(in, clk, lp, sp, ls, ss);
	input in, clk;
	output lp, sp, ls, ss;

	reg c1, c0, next_st, st;

	wire changed;
	assign changed = next_st ^ st;

	wire added_c1, added_c0;
	assign added_c1 = ~c1 & c0 | c1;
	assign added_c0 = ~c1 & ~c0 | c1;

	wire next_c1, next_c0;
	assign next_c1 = added_c1 & ~changed;
	assign next_c0 = added_c0 & ~changed;

	assign sp = changed & st & ~c1;
	assign lp = changed & st & c1;
	assign ss = changed & ~st & ~c1;
	assign ls = changed & ~st & c1;

	always @(posedge clk) begin
		c1 <= next_c1;
		c0 <= next_c0;
		next_st <= in;
		st <= next_st;
	end

	initial begin
		c1 = 0; c0 = 0; next_st = 0; st = 0;
	end

endmodule
