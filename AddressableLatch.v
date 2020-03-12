module AddressableLatch(Address, CE, D, G, Q);
	input CE;
	input [2:0] Address;
	input D, G;
	output reg [7:0] Q;
	
	
	always @(posedge CE)
		begin
			if (!G)
				begin
					Q[Address] <= !D;
				end
		end
			
			
endmodule