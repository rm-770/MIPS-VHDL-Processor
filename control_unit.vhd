----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:14:58 11/13/2025 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit is
    Port ( op : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           AluSrc : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUOp1 : out  STD_LOGIC;
           ALUOp0 : out  STD_LOGIC);
end control_unit;

architecture Behavioral of control_unit is

begin
process (op)
begin
	RegDst   <= '0';
    AluSrc   <= '0';
    MemtoReg <= '0';
    RegWrite <= '0';
    MemRead  <= '0';
    MemWrite <= '0';
    Branch   <= '0';
    ALUOp1   <= '0';
    ALUOp0   <= '0';
	 
	if op = "000000" then --R
		RegDst <= '1';
		AluSrc <= '0';
		MemtoReg <= '0';
		RegWrite <= '1';
		MemRead <= '0';
		MemWrite <= '0';
		Branch <= '0';
		ALUOp1 <= '1';
		ALUOp0 <= '0';
	elsif op = "100011" then --lw
		RegDst <= '0';
		AluSrc <= '1';
		MemtoReg <= '1';
		RegWrite <= '1';
		MemRead <= '1';
		MemWrite <= '0';
		Branch <= '0';
		ALUOp1 <= '0';
		ALUOp0 <= '0';
	elsif op = "101011" then --sw
		--RegDst <= '0';
		AluSrc <= '1';
		--MemtoReg <= '1';
		RegWrite <= '0';
		MemRead <= '0';
		MemWrite <= '1';
		Branch <= '0';
		ALUOp1 <= '0';
		ALUOp0 <= '0';
	elsif op = "000100" then --beq
		--RegDst <= '0';
		AluSrc <= '0';
		--MemtoReg <= '1';
		RegWrite <= '0';
		MemRead <= '0';
		MemWrite <= '0';
		Branch <= '1';
		ALUOp1 <= '0';
		ALUOp0 <= '1';
	end if;
end process;
	


end Behavioral;

