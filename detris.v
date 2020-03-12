`timescale 1ns / 1ns // `timescale time_unit/time_precision

//SW[2:0] data inputs
//SW[9] select signal

//LEDR[0] output display

module detris(LEDR, SW, KEY, CLOCK50);
    input [9:0] SW;
	 input [3:0] KEY;
	 input CLOCK50;
    output [9:0] LEDR;
	 
	 blocks my_next_blocks(.out(LEDR[2:0]), .hold(LEDR[5:3]), .ShiftRight(KEY[2]), .clk(CLOCK50), .reset_n(KEY[0]),.swap(KEY[1]));
endmodule