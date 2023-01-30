// This maps a 4x4 keyboard to a 3x6

module KeyboardDecoder(Clock, Keyb_Row_I, Keyb_Col_O, Keyb_Value);
	input Clock;
	
	//	Live Keyboard
	input [3:0] Keyb_Row_I;
	output [3:0] Keyb_Col_O;
	
	// Maped keyboard
	output reg [5:0] Keyb_Value;
	reg [5:0] Value;
	
	reg [2:0] CycleCount;
	reg [1:0] CurrentRow;
	reg [3:0] CurrentRowCount;
	
	
	assign Keyb_Col_O = 1 << CurrentRow;

	
	always @ (posedge Clock)
		begin				
			// This will hold the value on the output for 8 Clock cycles
			if (CycleCount == 4)
				begin
					Keyb_Value = Value;
				end
		
			if (Keyb_Row_I[0])
				begin
					Value = CurrentRowCount + 1;
				end				
			else if (Keyb_Row_I[1])
				begin
					Value = CurrentRowCount + 2;
				end				
			else if (Keyb_Row_I[2])
				begin
					Value = CurrentRowCount + 3;
				end				
			else if (Keyb_Row_I[3])
				begin
					Value = CurrentRowCount + 4;
				end
			else if (CurrentRow == 0)
				begin
					Value = 0;
				end
							
			CurrentRowCount = CurrentRow * 4;
			CycleCount = CycleCount + 1;
			CurrentRow = CurrentRow + 1;
		end
			
			
endmodule