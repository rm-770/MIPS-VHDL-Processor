--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:26:44 12/18/2025
-- Design Name:   
-- Module Name:   /home/ise/rita_mips231011034/mem_test.vhd
-- Project Name:  rita_mips231011034
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Memory_Unit
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
 
ENTITY mem_test IS
END mem_test;
 
ARCHITECTURE behavior OF mem_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory_Unit
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         WriteData : IN  std_logic_vector(31 downto 0);
         ReadData : OUT  std_logic_vector(31 downto 0);
         MemWrite : IN  std_logic;
         MemRead : IN  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');
   signal MemWrite : std_logic := '0';
   signal MemRead : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal ReadData : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory_Unit PORT MAP (
          Address => Address,
          WriteData => WriteData,
          ReadData => ReadData,
          MemWrite => MemWrite,
          MemRead => MemRead,
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		Address <= X"00000000";
		MemWrite <= '0';
		MemRead <= '1';
		wait for 200 ns;
		Address <= X"00000004";
		MemWrite <= '1';
		MemRead <= '0';
		WriteData <= X"FFFFFFFF";
      wait;
   end process;

END;
