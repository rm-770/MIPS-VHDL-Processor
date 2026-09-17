--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:40:45 11/13/2025
-- Design Name:   
-- Module Name:   D:/rita_mips231011034/control_unit_test.vhd
-- Project Name:  rita_mips231011034
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control_unit
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
 
ENTITY control_unit_test IS
END control_unit_test;
 
ARCHITECTURE behavior OF control_unit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_unit
    PORT(
         op : IN  std_logic_vector(5 downto 0);
         RegDst : OUT  std_logic;
         AluSrc : OUT  std_logic;
         MemtoReg : OUT  std_logic;
         RegWrite : OUT  std_logic;
         MemRead : OUT  std_logic;
         MemWrite : OUT  std_logic;
         Branch : OUT  std_logic;
         ALUOp1 : OUT  std_logic;
         ALUOp0 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal RegDst : std_logic;
   signal AluSrc : std_logic;
   signal MemtoReg : std_logic;
   signal RegWrite : std_logic;
   signal MemRead : std_logic;
   signal MemWrite : std_logic;
   signal Branch : std_logic;
   signal ALUOp1 : std_logic;
   signal ALUOp0 : std_logic;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_unit PORT MAP (
          op => op,
          RegDst => RegDst,
          AluSrc => AluSrc,
          MemtoReg => MemtoReg,
          RegWrite => RegWrite,
          MemRead => MemRead,
          MemWrite => MemWrite,
          Branch => Branch,
          ALUOp1 => ALUOp1,
          ALUOp0 => ALUOp0
        );

   -- Clock process definitions
   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      op <= "000000";
		wait for 100 ns;
		op <= "100011";
		wait for 100 ns;
		op <= "101011";
		wait for 100 ns;
		op <= "000100";
		wait for 100 ns;
	wait;
   end process;

END;
