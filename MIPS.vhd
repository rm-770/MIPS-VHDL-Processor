----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:51:24 12/11/2025 
-- Design Name: 
-- Module Name:    MIPS - Behavioral 
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

entity MIPS is
	Port(clkm: in STD_LOGIC);
end MIPS;

architecture Behavioral of MIPS is
	Component ALU is
			Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
				  b : in  STD_LOGIC_VECTOR (31 downto 0);
				  operation : in  STD_LOGIC_VECTOR (3 downto 0);
				  zero : out  STD_LOGIC;
				  result : out  STD_LOGIC_VECTOR (31 downto 0));
	end Component;
	Component MUX_2_1 is
		 generic(N: integer := 32);
			Port ( a : in  STD_LOGIC_VECTOR ((N-1) downto 0);
           b : in  STD_LOGIC_VECTOR ((N-1) downto 0);
           sel : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR ((N-1) downto 0));
	end Component;
	Component alu_control is
    Port ( aluop : in  STD_LOGIC_VECTOR (1 downto 0);
           funcfield : in  STD_LOGIC_VECTOR (5 downto 0);
           op : out  STD_LOGIC_VECTOR (3 downto 0));
	end Component;
	Component control_unit is
    Port ( op : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           AluSrc : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUOp1 : out  STD_LOGIC;
           ALUOp0 : out  STD_LOGIC);
	end Component;
	Component reg_file is
    Port ( CLK : in  STD_LOGIC;
           ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           RegWrite: in  STD_LOGIC;
           ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0));
	end Component;
	Component instruction_memory is
	Port ( readAddress : in  STD_LOGIC_VECTOR (31 downto 0);
           instruction : out  STD_LOGIC_VECTOR (31 downto 0)
			  --clk:in  STD_LOGIC
			  );
	end Component;
	Component Memory_Unit is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           ReadData : out  STD_LOGIC_VECTOR (31 downto 0);
           MemWrite : in  STD_LOGIC;
           MemRead : in  STD_LOGIC;
           CLK : in  STD_LOGIC);
	end Component;
	Component PC is
    Port ( clk : in  STD_LOGIC;
           inp : in  STD_LOGIC_VECTOR (31 downto 0);
           outp : out  STD_LOGIC_VECTOR (31 downto 0));
	end Component;
	Component Adder is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Sum : out  STD_LOGIC_VECTOR (31 downto 0));
	end Component;
	Component ShiftLeft is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
	end Component;
	Component sign_ext is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
	end Component;
	
	


   signal ALUinput1: std_logic_vector(31 downto 0) := (others => '0');
	signal ALUinput2: std_logic_vector(31 downto 0) := (others => '0');
	signal ALUoutput: std_logic_vector(31 downto 0);
	signal ALUzeroFlag: std_logic;
	signal ALUselect: std_logic_vector(3 downto 0);
	
	signal PCoutput: std_logic_vector(31 downto 0) := x"00000000"; 
	signal PCinput: std_logic_vector (31 downto 0) := x"00000000";
	signal AdderOut: std_logic_vector (31 downto 0);
	
	signal inputInstruction: std_logic_vector(31 downto 0) := x"00000000"; 
	signal readData2     : std_logic_vector(31 downto 0) := (others => '0');
	signal dataMemoryOut : std_logic_vector(31 downto 0) := (others => '0');
	signal writeDataIn: std_logic_vector (31 downto 0);
	signal MUXregDstOut:std_logic_vector (4 downto 0);
	
	signal regDstControlSig: std_logic;
	signal branchControlSig: std_logic;
	signal memReadControlSig: std_logic;
	signal memToRegControlSig: std_logic;
	signal ALUopControl: std_logic_vector (1 downto 0);
	signal memWriteControlSig: std_logic;
	signal ALUSrcControlSig: std_logic;
	signal RegWriteControlSig: std_logic;
	
	signal SignExtender: std_logic_vector (31 downto 0);
	signal shiftLeft2: std_logic_vector (31 downto 0);
	
	signal ALUoutputToPCMUX: std_logic_vector (31 downto 0);
	signal PCMUXcontrol: std_logic;

begin

PC1 : PC PORT MAP(
		clk => clkm,
      inp =>PCinput,
      outp => PCoutput	  
		);


IM : instruction_memory PORT MAP(
			readAddress => PCoutput,
         instruction => inputInstruction
			);

muxRd : MUX_2_1 generic map (N=>5) PORT MAP(
			a => inputInstruction (20 downto 16),
         b => inputInstruction (15 downto 11),
         sel => regDstControlSig,
         z => MUXregDstOut 
			  );

RF : reg_file PORT MAP( 
			ReadReg1 => inputInstruction (25 downto 21),
           ReadReg2 => inputInstruction (20 downto 16),
           WriteReg => MUXregDstOut,
           WriteData => writeDataIn,
			  RegWrite => RegWriteControlSig,
           ReadData1 => ALUinput1,
           ReadData2 => readData2,
			  CLK => clkm
			  );
			  
MemMux : MUX_2_1 PORT MAP(
		a => ALUoutput,
		b => dataMemoryOut,
		sel => memToRegControlSig,
		z => writeDataIn 
		);
		
DM : Memory_Unit PORT MAP (
			Address  => ALUoutput,
           WriteData => readData2,
           ReadData  => dataMemoryOut,
           MemRead => memReadControlSig,
           MemWrite => memWriteControlSig,
			  CLK  => clkm
			  );
			  
CU : control_unit PORT MAP ( 
			op => inputInstruction (31 downto 26),
         RegDst => regDstControlSig,
         AluSrc => ALUSrcControlSig,
         MemtoReg => memToRegControlSig,
         RegWrite => RegWriteControlSig,
         MemRead => memReadControlSig,
         MemWrite => memWriteControlSig,
         Branch => branchControlSig,
         ALUOp0 => ALUopControl(0),
			ALUOp1 => ALUopControl(1)
			);
muxALU : MUX_2_1 PORT MAP(
			a => readData2,
           b => SignExtender,
           sel => ALUSrcControlSig,
           z => ALUinput2 
			  );

ALUMips : ALU PORT MAP( 
			a => ALUinput1,
           b => ALUinput2,
           operation => ALUselect,
           result => ALUoutput,
           zero => ALUzeroFlag
			  );			

ALUC : alu_control PORT MAP(
			  funcfield => inputInstruction (5 downto 0),
           aluop => ALUopControl,
           op => ALUselect
			  );


PCMUXcontrol <= (branchControlSig AND ALUzeroFlag);

muxPC : MUX_2_1 PORT MAP( 
			a => AdderOut,
           b => ALUoutputToPCMUX,
           sel => PCMUXcontrol,
           z=> PCinput
			  );

AddPC : Adder PORT MAP(
		A => PCoutput,
      B => x"00000004",
      Sum => AdderOut
		);

SE : sign_ext PORT MAP(
			A => inputInstruction (15 downto 0),
         B => SignExtender
			  );

SHLB : ShiftLeft PORT MAP (
			a  => SignExtender,
           b => shiftLeft2
			  );		

AddBranch : Adder PORT MAP(
		A => AdderOut,
      B => shiftLeft2,
      Sum => ALUoutputToPCMUX
		);

		

end Behavioral;

