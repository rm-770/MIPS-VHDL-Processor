----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:50:13 09/27/2025 
-- Design Name: 
-- Module Name:    MUX_2_1 - Behavioral 
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

entity MUX_2_1 is
generic(N: integer := 32);
    Port ( a : in  STD_LOGIC_VECTOR ((N-1) downto 0);
           b : in  STD_LOGIC_VECTOR ((N-1) downto 0);
           sel : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR ((N-1) downto 0));
end MUX_2_1;

architecture Behavioral of MUX_2_1 is

begin
process(a,b,sel)
begin

if sel = '0' then
   z<=a;
else
   z<=b;
end if;


end process;

end Behavioral;

