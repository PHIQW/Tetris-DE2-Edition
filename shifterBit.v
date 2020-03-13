module shifter3Bit(load_val, load_n, shift, in, out, clk, reset_n);
	input [2:0]load_val;
	input load_n, shift, in, clk, reset_n;
	output [2:0]out;
	
	wire wire_ShiftOut, wireLoadOut;
	
	mux2to1 shift_mux(
			.x(out),
			.y(in),
			.s(shift),
			.m(wire_ShiftOut)
			);
			
	mux2to1 load_mux(
			.x(load_val),
			.y(wire_ShiftOut),
			.s(load_n),
			.m(wire_LoadOut)
			);
			
	flipflop3Bit shift_flipflop(
				.q(out),
				.d(wire_LoadOut),
				.clock(clk),
				.reset_n(reset_n)
				);
endmodule

module blocks(out, hold, ShiftRight, clk, reset_n, swap);
	input ShiftRight, clk, reset_n, swap;
	output[2:0] out, hold;
	
	wire [2:0]w01, w12, w23, w34, wBlockGen;
	
	random_generator_06 block_gen(.clk(clk), .out(wBlockGen));
	
	//never load values, only shift so load_n = 1, shift always so shift always 1
	shifter3Bit n0(.load_val(hold), .load_n(swap), .shift(1'b1), .in(w01), .out(out), .clk((ShiftRight ~^ swap)), .reset_n(reset_n));
	shifter3Bit n1(.load_n(1'b1), .shift(1'b1), .in(w12), .out(w01), .clk(ShiftRight & (~swap)), .reset_n(reset_n));
	shifter3Bit n2(.load_n(1'b1), .shift(1'b1), .in(w23), .out(w12), .clk(ShiftRight & (~swap)), .reset_n(reset_n));
	shifter3Bit n3(.load_n(1'b1), .shift(1'b1), .in(w34), .out(w23), .clk(ShiftRight & (~swap)), .reset_n(reset_n));
	shifter3Bit n4(.load_n(1'b1), .shift(1'b1), .in(wBlockGen), .out(w34), .clk(ShiftRight & (~swap)), .reset_n(reset_n));
	
	//hold value
	shifter3Bit h0(.load_val(out), .load_n(swap), .shift(1'b0), .out(hold), .clk((~ShiftRight) & swap), .reset_n(reset_n));
	
endmodule
	