//inputs are controls all 1 bit
//output is an x,y,colour on the board and the nextblocks,holdblocks
module tetris_game(x,y,colour,next,hold,mleft,mright,sdrop,hdrop,rclock,rcoclock,swap,pause,clock);
	input mleft,mright,sdrop,hdrop,rclock,rcoclock,swap,pause,clock;
	output x,y;
	output [2:0]colour;
	output next;
	output hold;
	
	wire drop_tick, shift_blocks;
	
	//rate divider for block drop
	//digit at 2'b01 is 1 second
	rateDivider50MHz drop_ticker(.divOut(drop_tick), .enable(1'b1), .digitControl(2'b01), .clock50M(clock), .clear_b());
	
	//next blocks and the held block
	blocks(.out(), .hold(hold), .ShiftRight(~shift_blocks), .clk(clock), .reset_n(),.swap(swap));
	
	//board
	
	
	//game ticks run at 50mhz
	always @(negedge clock)
	begin
	//do stuff with input
	
	end
	
endmodule
