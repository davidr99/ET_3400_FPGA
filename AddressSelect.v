module memoryDecoder(Address, Address_Valid, Clock, CE_ROM, ROM_ADDRESS, CE_RAM, RAM_ADDRESS, CE_DISPLAY, DISP_ADDRESS, CE_KEYBOARD, KEYB_ADDRESS);
	input [15:0] Address;
	input Address_Valid;
	input Clock;
	
	output [9:0] 	ROM_ADDRESS;
	output [8:0] 	RAM_ADDRESS;
	output [3:0]	KEYB_ADDRESS;
	output [6:0]	DISP_ADDRESS;
	
	output CE_ROM;
	output CE_RAM;
	output CE_DISPLAY;
	output CE_KEYBOARD;
	
	wire valid_address = Address_Valid && !Clock;
	
	assign CE_ROM = (Address >= 16'hFC00) && valid_address;
	assign CE_RAM = (Address <= 16'h01FF) && valid_address;
	assign CE_DISPLAY = (Address >= 16'hC100 && Address <= 16'hC1FF) && valid_address;
	assign CE_KEYBOARD = (Address >= 16'hC000 && Address <= 16'hC00F) && valid_address;
	
	assign ROM_ADDRESS = !CE_ROM ? 9'b0 : (Address & ~(16'hFC00));
	assign RAM_ADDRESS = !CE_RAM ? 8'b0 : Address;
	assign DISP_ADDRESS = !CE_DISPLAY ? 6'b0 : (Address - (16'hC100));
	assign KEYB_ADDRESS = !CE_KEYBOARD ? 3'b0 : (Address & ~(16'hC000));


	/*
	always @ (Address or Address_Valid or Clock)
		begin		
			if (Address_Valid && !Clock)
				begin			
					ROM_ADDRESS = 0;
					RAM_ADDRESS = 0;
					KEYB_ADDRESS = 0;
					DISP_ADDRESS = 0;
					
				
					if (Address >= 16'hFC00)
						begin 
							ROM_ADDRESS = (Address - 16'hFC00);
						end
					if (Address <= 16'h01FF)
						begin
							RAM_ADDRESS = Address;
						end
					if (Address >= 16'hC100 && Address <= 16'hC1FF)
						begin
							DISP_ADDRESS = Address - 16'hC100;
						end
					if (Address >= 16'hC000 && Address <= 16'hC0FF)
						begin
							KEYB_ADDRESS = Address - 16'hC000;
						end
				end
			else
				begin
				end
		end
		*/
			
			
endmodule