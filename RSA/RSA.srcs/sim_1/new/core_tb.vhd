library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Core_tb is
end;

architecture bench of Core_tb is

 component Core
      Port (
             key_ed : in STD_LOGIC_VECTOR (255 downto 0);
             key_n : in STD_LOGIC_VECTOR (255 downto 0);
             msgin_data : in STD_LOGIC_VECTOR (255 downto 0);
             msgin_valid : in STD_LOGIC;
             msgout_data : out STD_LOGIC_VECTOR (255 downto 0);
             msgout_valid : out STD_LOGIC;
              clk : in STD_LOGIC;
              reset_n : in STD_LOGIC;
              CLK_flag : out STD_LOGIC;
           program_c_r : out STD_LOGIC_VECTOR (7 downto 0);
           ALU_R_r     : out STD_LOGIC_VECTOR (255 downto 0)
             );
  end component;

  signal key_ed: STD_LOGIC_VECTOR (255 downto 0);
  signal key_n: STD_LOGIC_VECTOR (255 downto 0);
  signal msgin_data: STD_LOGIC_VECTOR (255 downto 0);
  signal msgin_valid: STD_LOGIC;
  signal msgout_data: STD_LOGIC_VECTOR (255 downto 0);
  signal msgout_valid: STD_LOGIC;
  signal clk: STD_LOGIC := '0';
  signal reset_n: STD_LOGIC;
  signal CLK_flag: STD_LOGIC ;
  constant clk_period : time := 1 ns;
  signal program_c_r: STD_LOGIC_VECTOR (7 downto 0);
  signal ALU_R_r     :  STD_LOGIC_VECTOR (255 downto 0);

begin
 clk <= not clk after clk_period/2;
  uut: Core port map ( key_ed       => key_ed,
                       key_n        => key_n,
                       msgin_data   => msgin_data,
                       msgin_valid  => msgin_valid,
                       msgout_data  => msgout_data,
                       msgout_valid => msgout_valid,
                       clk          => clk,
                       reset_n      => reset_n,
                       program_c_r  => program_c_r,
                       ALU_R_r      => ALU_R_r,
                       CLK_flag     => CLK_flag );

  stimulus: process
  begin
  
    --Put initialisation code here
    wait for 1*clk_period;
    reset_n <= '0';    
    wait for 1*clk_period;
    reset_n <= '1';    
    
    key_ed <= (7 downto 0 => '1', others => '0');
    key_n <= (10 downto 0 => '1', others => '0');
    msgin_data <= (5 downto 0 => '1', others => '0');
    msgin_valid <= '1';

    -- Put test bench stimulus code here

    wait;
  end process;


end;