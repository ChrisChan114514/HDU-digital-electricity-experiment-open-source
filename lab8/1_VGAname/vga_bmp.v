module vga_bmp
(
	input					clk,
	input				   reset_n,

	output		 	   VGA_HSYNC,
	output 		 	   VGA_VSYNC,

	output    [11:0]  VGA_D
);

reg  			clk25M;

wire [ 5:0]	rgb;
wire [14:0]	addr;

always @(posedge clk or negedge reset_n) begin
	if (!reset_n)
		clk25M <= 0;
	else
		clk25M <= ~clk25M;
end

rom_bmp rom_bmp_inst (
	.address 	(addr),
	.clock 		(clk25M),
	.q 			(rgb)
);

vga_disp u_vga_disp(
	.clk25M 	   (clk25M),
	.reset_n		(reset_n),
	.rgb			(rgb),
	.VGA_HSYNC	(VGA_HSYNC),
	.VGA_VSYNC	(VGA_VSYNC),
	.addr			(addr),
	.VGA_D		(VGA_D)
);

endmodule


