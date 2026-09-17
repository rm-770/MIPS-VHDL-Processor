----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:30:28 12/11/2025 
-- Design Name: 
-- Module Name:    sign_ext - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sign_ext is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
end sign_ext;

architecture Behavioral of sign_ext is

begin
	process(A)
	begin
		if A(15) = '0' then
			B <= X"0000" & A;
		else 
			B <= X"ffff" & A;
		end if;
	end process;
end Behavioral;

