`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:25:30 11/27/2017
// Design Name:   mul16
// Module Name:   C:/Users/IQBAL/Documents/Xilinx/mul16x16/test_bench.v
// Project Name:  mul16x16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mul16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench;

	// Inputs
	reg clk;
	reg [7:0] bus_in;
	reg [1:0] i_sel;
	reg i_enable;
	reg [1:0] o_sel;
	reg o_enable;

	// Outputs
	wire [7:0] bus_out;

	// Instantiate the Unit Under Test (UUT)
	mul16 uut (
		.clk(clk), 
		.bus_in(bus_in), 
		.i_sel(i_sel), 
		.i_enable(i_enable), 
		.bus_out(bus_out), 
		.o_sel(o_sel), 
		.o_enable(o_enable)
	);
	
	reg	[15:0]	a= 16'd12;
	reg	[15:0]	b= 16'd24;
	reg	[31:0]	c = 32'd288;
	reg	[31:0]	out_result = 32'd0;
	
	
	initial begin
		// Initialize Inputs
		clk = 0;	bus_in = 0;	i_sel = 0;	i_enable = 0;	o_sel = 0;	o_enable = 0;	#6;
		o_enable =	1; #6;
		i_sel = 2'b00;	bus_in = a[15:8];	#6;
		i_sel = 2'b01;	bus_in = a[7:0];	#6;
		i_sel = 2'b10;	bus_in = b[15:8];	#6;
		i_sel = 2'b11;	bus_in = b[7:0];	#6;
		o_enable =	0; #200;
		i_enable = 1;	#6;
		o_sel = 2'b00;		#6;
		out_result[31:24] = bus_out; 	#6;
		o_sel = 2'b01;		#6;
		out_result[23:16] = bus_out;	#6; 	
		o_sel = 2'b10; 	#6;
		out_result[15:8] = bus_out;	#6;
		o_sel = 2'b11; 	#6;
		out_result[7:0] = bus_out;		#6;
		i_enable = 0;	#6

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   always #1 clk=~clk;   
endmodule

