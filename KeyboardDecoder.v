// This maps a 4x4 keyboard to a 3x6

module KeyboardDecoder(Clock, Keyb_Row_I, Keyb_Col_O, Keyb_Value);
	input Clock;
	
	//	Live Keyboard
	input [3:0] Keyb_Row_I;
	output [3:0] Keyb_Col_O;
	
	// Maped keyboard
	output reg [5:0] Keyb_Value;
	
	reg [5:0] Value;
	reg [2:0] CurrentCol;
	reg [3:0] CurrentColVal;
	
	reg [1:0] cycle;
	
	
	assign Keyb_Col_O = 1 << CurrentCol;

	
	always @ (posedge Clock)
		begin
			cycle = cycle + 1;		
			if (cycle == 2'b11)
				begin			
				
					if (CurrentCol == 5)
						begin
							Value <= 0;
							CurrentCol <= 0;
							CurrentColVal <= 0;
							Keyb_Value <= Value;
						end
					else
						begin
							CurrentCol <= CurrentCol + 1;
							CurrentColVal <= (CurrentCol + 1) << 2;
						end
						
					if (Keyb_Row_I[0] && CurrentCol < 5)
						begin
							Value <= CurrentColVal + 1;
						end				
					else if (Keyb_Row_I[1] && CurrentCol < 5)
						begin
							Value <= CurrentColVal + 2;
						end				
					else if (Keyb_Row_I[2] && CurrentCol < 5)
						begin
							Value <= CurrentColVal + 3;
						end				
					else if (Keyb_Row_I[3] && CurrentCol < 5)
						begin
							Value <= CurrentColVal + 4;
						end
				end
		end
			
			
endmodule
