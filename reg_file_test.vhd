--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:05:55 11/13/2025
-- Design Name:   
-- Module Name:   D:/rita_mips231011034/reg_file_test.vhd
-- Project Name:  rita_mips231011034
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg_file
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
 
ENTITY reg_file_test IS
END reg_file_test;
 
ARCHITECTURE behavior OF reg_file_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_file
    PORT(
          CLK : in  STD_LOGIC;
           ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           RegWrite: in  STD_LOGIC;
           ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0));
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal ReadReg1 : std_logic_vector(4 downto 0) := (others => '0');
   signal ReadReg2 : std_logic_vector(4 downto 0) := (others => '0');
   signal WriteReg : std_logic_vector(4 downto 0) := (others => '0');
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');
   signal RegWrite : std_logic := '0';

 	--Outputs
   signal ReadData1 : std_logic_vector(31 downto 0);
   signal ReadData2 : std_logic_vector(31 downto 0);
 
   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_file PORT MAP (
          CLK => CLK,
          ReadReg1 => ReadReg1,
          ReadReg2 => ReadReg2,
          WriteReg => WriteReg,
          WriteData => WriteData,
          RegWrite => RegWrite,
          ReadData1 => ReadData1,
          ReadData2 => ReadData2
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
    ReadReg1 <= "00000";
	 ReadReg2 <= "00001";
	 wait for 100 ns;
	 RegWrite <= '1';
	 WriteReg <= "00000";
	 WriteData <= X"FFFFFFFF";
	 wait for 100 ns;
	end process;

END;
