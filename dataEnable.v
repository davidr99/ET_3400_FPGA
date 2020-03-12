module dataEnable(EN, DATA_I, DATA_O);
	input EN;
	input [7:0] DATA_I;
	output reg [7:0] DATA_O;
	
	
	always @(*)
		begin
		
			DATA_O = EN ? DATA_I : 8'bZZZZZZZZ;
		
		end
			
			
endmodule