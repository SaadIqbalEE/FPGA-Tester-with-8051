`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:45:03 11/27/2017 
// Design Name: 
// Module Name:    mul16 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mul16(	clk,
					bus_in,
					i_sel,
					i_enable,
					bus_out,
					o_sel,
					o_enable
    );
	parameter	AH= 2'b00, AL=2'b01, BH= 2'b10, BL=2'b11;
	parameter	C1= 2'b00, C2=2'b01, C3= 2'b10, C4=2'b11;
	
	input					clk;
	input 				i_enable;
	input			[1:0]	i_sel;
	input			[7:0]	bus_in;
	input					o_enable;
	input			[1:0]	o_sel;
	
	output reg	[7:0]	bus_out = 8'd0;
	
	reg		[15:0]	a,b;
	reg		[31:0]	c;
	
	always @(posedge clk)begin
	if(o_enable)begin
		case (i_sel)
		AH:begin
		a[15:8] <= bus_in;
		a[7:0]  <= a[7:0];
		b[15:8] <= b[15:8];
		b[7:0]  <= b[7:0];
		end
		AL:begin
		a[15:8] <= a[15:8];
		a[7:0]  <= bus_in;
		b[15:8] <= b[15:8];
		b[7:0]  <= b[7:0];		
		end
		BH:begin
		a[15:8] <= a[15:8];
		a[7:0]  <= a[7:0];
		b[15:8] <= bus_in;
		b[7:0]  <= b[7:0];
		end
		BL:begin
		a[15:8] <= a[15:8];
		a[7:0]  <= a[7:0];
		b[15:8] <= b[15:8];
		b[7:0]  <= bus_in;		
		end
		default:begin
		a[15:8] <= a[15:8];
		a[7:0]  <= a[7:0];
		b[15:8] <= b[15:8];
		b[7:0]  <= b[7:0];
		end
		endcase
	end
	else begin
		a[15:8] <= a[15:8];
		a[7:0]  <= a[7:0];
		b[15:8] <= b[15:8];
		b[7:0]  <= b[7:0];
	end
	end
	
	always @(a,b)begin
		c= a*b;
	end
	
	always @(posedge clk)begin
	if (i_enable)
		case (o_sel)
		C1:	bus_out <= c[31:24];
		C2:	bus_out <= c[23:16];
		C3:	bus_out <= c[15:8];
		C4:	bus_out <= c[7:0];
		default:	bus_out <= 8'd0;
		endcase
	end
endmodule
