module ii_4_2(x3, x2, x1, x0, l1, l0, z);
	input x3, x2, x1, x0;
	output l1, l0, z;

	assign l1 =
		~x0 & ~x1 & (x2 | x3);
	assign l0 =
		~x0 & x1  | ~x0 & ~x1 & ~x2 & x3;
	assign z = ~x3 & ~x2 & ~x1 & ~x0;
endmodule
