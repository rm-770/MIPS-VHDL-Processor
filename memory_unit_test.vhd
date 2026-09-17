--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:17:20 11/08/2025
-- Design Name:   
-- Module Name:   D:/Student/Desktop/romany gerges/MIPS_romany/memory_unit_test.vhd
-- Project Name:  MIPS_romany
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memory_unit
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
 
ENTITY memory_unit_test IS
END memory_unit_test;
 
ARCHITECTURE behavior OF memory_unit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memory_unit
    PORT(
         writedata : IN  std_logic_vector(31 downto 0);
         readdata : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         memread : IN  std_logic;
         memwrite : IN  std_logic;
         address : IN  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal writedata : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal memread : std_logic := '0';
   signal memwrite : std_logic := '0';
   signal address : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal readdata : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memory_unit PORT MAP (
          writedata => writedata,
          readdata => readdata,
          clk => clk,
          memread => memread,
          memwrite => memwrite,
          address => address
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
address <=X"00000000";
memread <= '1';
memwrite <='0' ;
wait for 100 ns;


address <=X"00000004";
memread <= '0';
memwrite <='1' ;
writedata <= X"ffffffff";
wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
