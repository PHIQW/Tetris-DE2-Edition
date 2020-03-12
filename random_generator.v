module random_generator_06(clk, out);
	input clk;
	output reg [2:0]out;
	
	always @(posedge clk)
	begin
	out <= (out == 3'b111) ? 0 : out+1'b1;
	end
endmodule
