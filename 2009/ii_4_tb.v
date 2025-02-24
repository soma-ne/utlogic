module ii_4_tb();
	reg in, clk;
	wire lp, sp, ls, ss;
	ii_4 ii_4(in, clk, lp, sp, ls, ss);

	initial begin
		in = 0; clk = 0;
		#10 in <= 1;
		#20 in <= 0;
		#20 in <= 1;
		#80 in <= 0;
		#80 in <= 1;
		#40 in <= 0;
		#40 in <= 1;
		#100 in <= 0;
		#100 in <= 1;
		$finish;
	end

	always #10 clk <= ~clk;

	initial begin
		$dumpfile("ii_4.vcd");
		$dumpvars(0, ii_4_tb);
	end

endmodule
