--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:03:43 09/27/2025
-- Design Name:   
-- Module Name:   D:/Student/Desktop/romany gerges/MIPS_romany/tb_mux_2_1.vhd
-- Project Name:  MIPS_romany
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_2_1
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_mux_2_1 IS
END tb_mux_2_1;
 
ARCHITECTURE behavior OF tb_mux_2_1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_2_1
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         sel : IN  std_logic;
         z : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal sel : std_logic := '0';

 	--Outputs
   signal z : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_2_1 PORT MAP (
          a => a,
          b => b,
          sel => sel,
          z => z
        );

  
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		a<= X"ffff1234";
		b<= X"12345678";
		sel<='0';
		wait for 100 ns;
		sel<='1';
		
		


      -- insert stimulus here 

      wait;
   end process;

END;
