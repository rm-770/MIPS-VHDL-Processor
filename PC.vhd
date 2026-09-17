----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:47:53 12/11/2025 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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
----------------------------------------------------------------------------------library IEEE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is
    Port ( clk : in  STD_LOGIC;
           inp : in  STD_LOGIC_VECTOR (31 downto 0);
           outp : out  STD_LOGIC_VECTOR (31 downto 0));
end pc;
-----------------------------------------------------------------
architecture Behavioral of pc is
    signal reg_value: STD_LOGIC_VECTOR(31 downto 0):= x"00000000";
begin
    outp <= reg_value; 

    process(clk)
    begin
        if(rising_edge(clk)) then
            reg_value <= inp;
        end if;
    end process;
end Behavioral;