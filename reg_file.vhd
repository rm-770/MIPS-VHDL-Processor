----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:58:20 11/13/2025 
-- Design Name: 
-- Module Name:    reg_file - Behavioral 
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


entity reg_file is
    Port ( CLK : in  STD_LOGIC;
           ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           RegWrite: in  STD_LOGIC;
           ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0));
end reg_file;

architecture Behavioral of reg_file is
	type A is array(0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
	signal Reg:A:=(
        0 => x"00000000", 
        4 => x"00000005", 
        5 => x"00000007",
        others => x"00000000");
	
begin
	ReadData1 <= Reg(conv_integer(ReadReg1));
	ReadData2 <= Reg(conv_integer(ReadReg2));
process(clk,RegWrite)
begin
	if RegWrite='1' and rising_edge(clk)
	then Reg(conv_integer(WriteReg))<= WriteData;
	end if;
end process;
end Behavioral;
