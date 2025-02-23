module i_4_tb();
	reg clk, data;
	wire out;

	i_4 i_4(clk, data, out);

	initial begin
		clk = 0; data = 0;
		#10 data <= 1;
		#20 data <= 0;
		#40 data <= 1;
		#60 data <= 0;
		#20 data <= 1;
		#20 data <= 0;
		#20 data <= 1;
		#40 data <= 0;
		#80 $finish;
	end

	always #10 clk <= ~clk;

	initial begin
		$dumpfile("i_4.vcd");
		$dumpvars(0, i_4_tb);
	end
endmodule
