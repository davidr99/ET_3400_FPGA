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
	reg [3:0] CycleCount;
	
	
	assign Keyb_Col_O = 1 << CurrentCol;

	
	always @ (posedge Clock)
		begin				
			// This will hold the value on the output for 8 Clock cycles
			if (CycleCount == 4)
				begin
					Keyb_Value <= Value;
					CycleCount = 0;
				end			
		
			if (Keyb_Row_I[0])
				begin
					Value = CurrentColVal + 1;
				end				
			else if (Keyb_Row_I[1])
				begin
					Value = CurrentColVal + 2;
				end				
			else if (Keyb_Row_I[2])
				begin
					Value = CurrentColVal + 3;
				end				
			else if (Keyb_Row_I[3])
				begin
					Value = CurrentColVal + 4;
				end
			else if (CurrentCol == 0)
				begin
					Value = 0;
				end
							
			CurrentColVal = (CurrentCol + 1) * 4;
			CycleCount = CycleCount + 1;
			CurrentCol = CurrentCol + 1;
		end
			
			
endmodule
