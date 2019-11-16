-- Testbench created online at:
--   www.doulos.com/knowhow/perl/testbench_creation/
-- Copyright Doulos Ltd
-- SD, 03 November 2002

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity exponentiation_tb is
end;

architecture bench of exponentiation_tb is

  component exponentiation
--  	generic (
--  		256 : integer := 256
--  	);
  	port (   
  		valid_in	: in STD_LOGIC;
  		ready_in	: out STD_LOGIC;
  		message 	: in STD_LOGIC_VECTOR ( 255 downto 0 );
  		key 		: in STD_LOGIC_VECTOR ( 255 downto 0 );
  		ready_out	: in STD_LOGIC;
  		valid_out	: out STD_LOGIC;
  		result 		: out STD_LOGIC_VECTOR(255 downto 0);
  		modulus 	: in STD_LOGIC_VECTOR(255 downto 0);
  		clk 		: in STD_LOGIC;
  		reset_n 	: in STD_LOGIC
         -- CLK_flag : out STD_LOGIC;
          --program_c_r : out STD_LOGIC_VECTOR (7 downto 0);
          --ALU_R_r     : out STD_LOGIC_VECTOR (255 downto 0)
  	);
  end component;

  signal valid_in: STD_LOGIC;
  signal ready_in: STD_LOGIC;
  signal message: STD_LOGIC_VECTOR ( 255 downto 0 );
  signal key: STD_LOGIC_VECTOR ( 255 downto 0 );
  signal ready_out: STD_LOGIC;
  signal valid_out: STD_LOGIC;
  signal result: STD_LOGIC_VECTOR(255 downto 0);
  signal modulus: STD_LOGIC_VECTOR(255 downto 0);
  signal clk: STD_LOGIC := '0';
  signal reset_n: STD_LOGIC;
  --signal CLK_flag: STD_LOGIC;
  --signal program_c_r: STD_LOGIC_VECTOR (7 downto 0);
  --signal ALU_R_r: STD_LOGIC_VECTOR (255 downto 0) ;
  signal x2 : STD_LOGIC_VECTOR (239 downto 0) := (others => '0');
  constant clk_period : time := 12 ns;
  
  
begin

  -- Insert values for generic parameters !!
  uut: exponentiation --generic map ( 256 =>  )
                         port map ( valid_in     => valid_in,
                                    ready_in     => ready_in,
                                    message      => message,
                                    key          => key,
                                    ready_out    => ready_out,
                                    valid_out    => valid_out,
                                    result       => result,
                                    modulus      => modulus,
                                    clk          => clk,
                                    reset_n      => reset_n);
                                    --CLK_flag     => CLK_flag,
                                    --program_c_r  => program_c_r,
                                    --ALU_R_r      => ALU_R_r );



    clk_gen: process is
	begin
		clk <= '1';
		wait for 6 ns;
		clk <= '0';
		wait for 6 ns;
	end process;
	
  stimulus: process
  begin
  
    -- Put initialisation code here



 --Put initialisation code here
    wait for 1*clk_period;
    reset_n <= '0';    
    wait for 1*clk_period;
    reset_n <= '1';    
    
    
    --M^(ed) mod n
    message <= x2 & "00000101" & "00001001";
    key <=    x2 & "00000000" &  "11111111"; --(others => '1') ; 
    modulus <=      x2 & "01100100" & "10110001";
    valid_in <= '1';

    -- Put test bench stimulus code here
    -- Put test bench stimulus code here

    wait;
  end process;


end;


