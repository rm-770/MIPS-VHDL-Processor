----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:53:12 10/04/2025 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           operation : in  STD_LOGIC_VECTOR (3 downto 0);
           zero : out  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is
begin
	process(A,B,operation)
begin
    if operation= "0000" then Result <= A and B;
    elsif operation= "0001" then Result <= A or B;
    elsif operation= "0010" then Result <= A + B;
    elsif operation= "0110" then Result <= A - B;
    elsif operation="1100" then Result <=A nor B;
    elsif operation="0111" then 
        if (A < B) then 
            Result <= x"00000001";
        else 
            Result <= x"00000000";
        end if;
    else Result <= (others => 'X'); -- Handle unlisted controls
    end if;

    if A = B then zero <= '1'; else zero <= '0';
    end if;
end process;
end Behavioral;