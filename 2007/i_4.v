module i_4(clk, data, out);
	input clk, data;
	output out;

	reg q0, q1;

	wire next_q0, next_q1;
	assign out = (q0 & clk) | (q1 & ~clk);
	assign next_q0 = ~out;
	assign next_q1 = ~data;


	always @(posedge clk) begin
		q0 <= next_q0;
	end

	always @(negedge clk) begin
		q1 <= next_q1;
	end

	initial begin
		q0 = 0; q1 = 0;
	end
endmodule
