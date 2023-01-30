// This maps a 4x4 keyboard to a 3x6

module KeyboardEmulator(Clock, Keyb_Value, Keyb_Col_I, Keyb_Row_O);
	input Clock;	
	input [5:0] Keyb_Value;
	
	//	Keyboard
	output reg [6:0] Keyb_Row_O;
	input [2:0] Keyb_Col_I;
	
	// E = #
	// F = *
	
	// Col
	// A0 A1 A2  Row
	// D  E  F    1
	// A  B  C    2
	// 7  8  9    3
	// 4  5  6    4
	// 1  2  3    5
	// 0	        6
	
	// 1 = 1  2 = 5  3 = 9   A = 13
	// 4 = 2  5 = 6  6 = 10  B = 14
	// 7 = 3  8 = 7  9 = 11  C = 15
	// * = 4  0 = 8  # = 12  D = 16
	
		
	always @ (posedge Clock)
		begin
			// A0 Col
			if (Keyb_Col_I  == 3'b110)
				begin
					case (Keyb_Value)
						16: Keyb_Row_O = ~(6'b1);
						13: Keyb_Row_O = ~(6'b10);
						 3: Keyb_Row_O = ~(6'b100);
						 2: Keyb_Row_O = ~(6'b1000);
						 1: Keyb_Row_O = ~(6'b10000);
						 8: Keyb_Row_O = ~(6'b100000);
						default: Keyb_Row_O = ~(6'b0);
					endcase
				end
				// A1 Col
			else if (Keyb_Col_I == 3'b101)
				begin
					case (Keyb_Value)
						12: Keyb_Row_O = ~(6'b1);
						14: Keyb_Row_O = ~(6'b10);
						 7: Keyb_Row_O = ~(6'b100);
						 6: Keyb_Row_O = ~(6'b1000);
						 5: Keyb_Row_O = ~(6'b10000);
						default: Keyb_Row_O = ~(6'b0);
					endcase
				end
				// A2 Col
			else if (Keyb_Col_I  == 3'b011)
				begin
					case (Keyb_Value)
						 4: Keyb_Row_O = ~(6'b1);
						15: Keyb_Row_O = ~(6'b10);
						11: Keyb_Row_O = ~(6'b100);
						10: Keyb_Row_O = ~(6'b1000);
						 9: Keyb_Row_O = ~(6'b10000);
						default: Keyb_Row_O = ~(6'b0);
					endcase
				end
			else 
				Keyb_Row_O = ~(6'b0);
		end
			
			
endmodule