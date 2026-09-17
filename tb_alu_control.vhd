--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:03:34 10/11/2025
-- Design Name:   
-- Module Name:   D:/Student/Desktop/romany gerges/MIPS_romany/tb_alu_control.vhd
-- Project Name:  MIPS_romany
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu_control
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
 
ENTITY tb_alu_control IS
END tb_alu_control;
 
ARCHITECTURE behavior OF tb_alu_control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu_control
    PORT(
         aluop : IN  std_logic_vector(1 downto 0);
         funcfield : IN  std_logic_vector(5 downto 0);
         op : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal aluop : std_logic_vector(1 downto 0) := (others => '0');
   signal funcfield : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal op : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu_control PORT MAP (
          aluop => aluop,
          funcfield => funcfield,
          op => op
        );

   -- Clock process definitions
 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      funcfield <="100000";
		aluop <="10";
		wait for 100 ns;
		
		funcfield <="100100";
		wait for 100 ns;
		
		funcfield <="101010";
		wait for 100 ns;
		
		
      

      -- insert stimulus here 

      wait;
   end process;

END;
