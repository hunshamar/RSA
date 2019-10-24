library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ALU_tb is
end;

architecture bench of ALU_tb is

  component ALU
      Port ( 
             A : in STD_LOGIC_VECTOR (255 downto 0);
             B : in STD_LOGIC_VECTOR (255 downto 0);
             ALU_select_instr : in STD_LOGIC_VECTOR (3 downto 0);
             ALU_output: out STD_LOGIC_VECTOR (255 downto 0);
             CMP_FLAG : out STD_LOGIC);
  end component;

  signal A: STD_LOGIC_VECTOR (255 downto 0);
  signal B: STD_LOGIC_VECTOR (255 downto 0);
  signal ALU_select_instr: STD_LOGIC_VECTOR (3 downto 0);
  signal ALU_output: STD_LOGIC_VECTOR (255 downto 0);
  signal CMP_FLAG: STD_LOGIC;
  signal x1 : STD_LOGIC_VECTOR (247 downto 0) := (others => '0');

begin
  uut: ALU port map ( A                => A,
                      B                => B,
                      ALU_select_instr => ALU_select_instr,
                      ALU_output       => ALU_output,
                      CMP_FLAG         => CMP_FLAG );

  stimulus: process
      
  begin
  
    -- Put initialisation code here

  
    
    A <= x1 & "10101011";
    B <= x1 & "00000101";
    
    wait for 5 ns;
    ALU_select_instr <= "0000";
    wait for 5 ns;
    ALU_select_instr <= "0001";
    wait for 5 ns;
    ALU_select_instr <= "0010";
    wait for 5 ns;
    ALU_select_instr <= "0011";
    wait for 5 ns;
    ALU_select_instr <= "0100";
    wait for 5 ns;
    ALU_select_instr <= "0101";
    wait for 5 ns;
    ALU_select_instr <= "0110";
    wait for 5 ns;
    ALU_select_instr <= "0111";
    wait for 5 ns;
    ALU_select_instr <= "1000";
    wait for 5 ns;
    ALU_select_instr <= "1001";
    wait for 5 ns;
    ALU_select_instr <= "1010";
    -- Put test bench stimulus code here

    wait;
  end process;



end;