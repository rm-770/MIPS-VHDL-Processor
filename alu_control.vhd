----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:46:44 10/11/2025 
-- Design Name: 
-- Module Name:    alu_control - Behavioral 
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

entity alu_control is
    Port ( aluop : in  STD_LOGIC_VECTOR (1 downto 0);
           funcfield : in  STD_LOGIC_VECTOR (5 downto 0);
           op : out  STD_LOGIC_VECTOR (3 downto 0));
end alu_control;

architecture Behavioral of alu_control is
begin
process(aluop, funcfield)
begin
    -- default
    op <= "0000";  

    if aluop = "00" then
        op <= "0010";  -- ADD for load/store
    elsif aluop = "01" then
        op <= "0110";  -- SUB for branch
    elsif aluop = "10" then
        if funcfield = "100000" then
            op <= "0010"; -- ADD
        elsif funcfield = "100010" then
            op <= "0110"; -- SUB
        elsif funcfield = "100100" then
            op <= "0000"; -- AND
        elsif funcfield = "100101" then
            op <= "0001"; -- OR
        elsif funcfield = "101010" then
            op <= "0111"; -- SLT
        else
            op <= "0000"; -- default
        end if;
    else
        op <= "0000"; -- default
    end if;
end process;
end Behavioral;