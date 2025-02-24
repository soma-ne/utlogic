module ii_4_tb();
	reg x3, x2, x1, x0;
	wire l1, l0, z;

	ii_4_2 ii_4_2(x3, x2, x1, x0, l1, l0, z);

	initial begin
		x3 = 0; x2 = 0; x1 = 0; x0 = 0;
		#10 x3 <= 1;
		#10 x2 <= 1;
		#10 x1 <= 1;
		#10 x0 <= 1;
		#10 x2 <= 0;
		#10 x0 <= 0;
		#10 x3 <= 0;
		#10 x1 <= 0;
		$finish;
	end

	initial begin
		$dumpfile("ii_4_2.vcd");
		$dumpvars(0, ii_4_tb);
	end
endmodule
