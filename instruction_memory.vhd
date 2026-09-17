----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    13:54:41 12/11/2025
-- Design Name:
-- Module Name:    instruction_memory - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity instruction_memory is
    Port ( readAddress : in  STD_LOGIC_VECTOR (31 downto 0);
           instruction : out  STD_LOGIC_VECTOR (31 downto 0)
			  --clk:in  STD_LOGIC
			  );
end instruction_memory;
architecture Behavioral of instruction_memory is

  TYPE RAM IS ARRAY(0 TO 63) OF std_logic_vector(7 DOWNTO 0);
	SIGNAL IM : RAM := (
	--INSTRICTIONS!! NO 
			x"00", x"85", x"10", x"20",--this is for add,$v0,$a0,$a1
			x"AC", x"02", x"00", x"08",--for sw,$v0,8($zero)
			x"8C", x"06", x"00", x"08",--for is lw,$a2,8($zero)
			x"10", x"46", x"00", x"01",--for beq,$v0,$a2,Good_Pross
			x"00", x"46", x"88", x"2A",--for slt,$s1,$v0,$a2
			x"00", x"A4", x"88", x"22",--forGood_Processor: sub,$s1,$a1,$a0
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00"
			 );
						
begin

	instruction(31 downto 24)<= IM(to_integer((unsigned(readAddress))));
		instruction(23 downto 16)<= IM(to_integer((unsigned(readAddress)+1)));
			instruction(15 downto 8)<= IM(to_integer((unsigned(readAddress)+2)));
instruction(7 downto 0)<= IM(to_integer((unsigned(readAddress)+3)));

end Behavioral;
