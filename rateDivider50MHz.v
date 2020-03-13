module rateDivider50MHz(divOut, enable, digitControl, clock50M, clear_b);
		input enable, clock50M, clear_b;
		input [1:0] digitControl;
		output divOut;
		
		reg [27:0] count;
	
		assign divOut = (count == 28'b0) ? 1 : 0;
		
		always @(posedge clock50M)
		begin
			if((clear_b == 1'b0) || (count == 0))
			begin
				case(digitControl)
					2'b00: count <= 28'd24999999;//.5s
					2'b01: count <= 28'd49999999;//1s
					2'b10: count <= 28'd99999999;//2s
					2'b11: count <= 28'd199999999;//4s
				endcase
			end
			else if(enable == 1'b1)
				count <= count - 1'b1;
		end
endmodule

//taken from lab 4 part 2
module counter4bit(q, clock, Clear_b, Enable);
	input clock, Clear_b, Enable;
	output reg [3:0] q; // declare q

	always @(posedge clock, negedge Clear_b) // triggered every time clock rises
	begin
		if (Clear_b == 1'b0) // when Clear_b is 0...
			q <= 4'b0000; // set q to 0
		else if (Enable == 1) // ...otherwise update q (only when Enable is 1)
			q <= q + 1'b1; // increment q
			// q <= q - 1'b1; // alternatively, decrement q
	end
endmodule
