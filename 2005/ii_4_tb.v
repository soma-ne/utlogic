module ii_4_tb();
	reg clk, count, reset;
	wire c0, c1, c2, c3;

	ii_4 ii_4i(clk, count, reset, c0, c1, c2, c3);

	initial begin
		clk = 0; count = 1; reset = 0;
		#510 reset <= 1;
		#550 reset <= 0;
		#590 count <= 0;
		#630 count <= 1;
		#1000 $finish;
	end
	always #10 clk <= ~clk;

	initial begin
		$dumpfile("ii_4.vcd");
		$dumpvars(0, ii_4_tb);
	end
endmodule
