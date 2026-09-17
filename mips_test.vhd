--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:14:07 12/18/2025
-- Design Name:   
-- Module Name:   /home/ise/rita_mips231011034/mips_test.vhd
-- Project Name:  rita_mips231011034
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MIPS
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
 
ENTITY mips_test IS
END mips_test;
 
ARCHITECTURE behavior OF mips_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MIPS
    PORT(
         clkm : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clkm : std_logic := '0';

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	
	signal Reset : STD_LOGIC := '1';
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MIPS PORT MAP (
          clkm => clkm
        );

 CLK_Process : process
    begin
        loop
            clkm <= '0';
            wait for CLK_PERIOD / 2;
            clkm <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

   -- Stimulus process
Stim_Process : process
    begin
        
        Reset<= '1';
        wait for CLK_PERIOD * 2; 
        Reset <= '0';
        wait for CLK_PERIOD / 2;
        wait until rising_edge(clkm); 
        wait until rising_edge(clkm); 
      
        wait until rising_edge(clkm); 
        
        wait until rising_edge(clkm); 
        wait until rising_edge(clkm); 
        
        wait until rising_edge(clkm); 
       
        wait until rising_edge(clkm); 
       
        wait for CLK_PERIOD;
        
    end process;
END;
