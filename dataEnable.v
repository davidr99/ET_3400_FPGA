module dataEnable(EN, DATA_I, DATA_O);
	input EN;
	input [7:0] DATA_I;
	output [7:0] DATA_O = EN ? DATA_I : 8'bZZZZZZZZ;			
			
endmodule