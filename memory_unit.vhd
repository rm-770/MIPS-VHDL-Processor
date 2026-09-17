----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:39:56 11/27/2025 
-- Design Name: 
-- Module Name:    Memory_Unit - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memory_Unit is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           ReadData : out  STD_LOGIC_VECTOR (31 downto 0);
           MemWrite : in  STD_LOGIC;
           MemRead : in  STD_LOGIC;
           CLK : in  STD_LOGIC);
end Memory_Unit;

architecture Behavioral of Memory_Unit is
    type RAM_Array is array (0 to 63) of STD_LOGIC_VECTOR(31 downto 0);
    signal RAM : RAM_Array := (others => (others => '0'));

    function word_index(addr: STD_LOGIC_VECTOR(31 downto 0)) return integer is
    begin
        return to_integer(unsigned(addr(7 downto 2)));
    end function;
begin
    -- synchronous write
    process(CLK)
    begin
        if rising_edge(CLK) then
            if MemWrite = '1' then
                RAM(word_index(Address)) <= WriteData;
            end if;
        end if;
    end process;

    -- combinational read
    ReadData <= RAM(word_index(Address)) when MemRead = '1' else (others => '0');
end Behavioral;