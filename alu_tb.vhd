--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:10:00 10/04/2025
-- Design Name:   
-- Module Name:   D:/Student/Desktop/romany gerges/MIPS_romany/alu_tb.vhd
-- Project Name:  MIPS_romany
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY alu_tb IS
END alu_tb;
 
ARCHITECTURE behavior OF alu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         operation : IN  std_logic_vector(3 downto 0);
         zero : OUT  std_logic;
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal operation : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal zero : std_logic;
   signal result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          a => a,
          b => b,
          operation => operation,
          zero => zero,
          result => result
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		a <= X"0000FF12";
		b <= X"5689ABCD";
		operation <= "0000";
		wait for 100 ns;
		operation <= "0001";
		wait for 100 ns;
		operation <= "0010";
		wait for 100 ns;
		operation <= "0110";
		wait for 100 ns;
		operation <= "0111";
		wait for 100 ns;
		
		
		a <= X"0000FF12";
		b <= X"0000FF12";
		operation <= "0111";
		wait for 100 ns;
		

     

      -- insert stimulus here 

      wait;
   end process;

END;
