library ieee;
use ieee.std_logic_1164.all;

entity exponentiation is
	generic (
		C_block_size : integer := 256
	);
	port (
		--input controll
		valid_in	: in STD_LOGIC;
		ready_in	: out STD_LOGIC;

		--input data
		message 	: in STD_LOGIC_VECTOR ( 255 downto 0 );
		key 		: in STD_LOGIC_VECTOR ( 255 downto 0 );

		--ouput controll
		ready_out	: in STD_LOGIC;
		valid_out	: out STD_LOGIC;

		--output data
		result 		: out STD_LOGIC_VECTOR(255 downto 0);

		--modulus
		modulus 	: in STD_LOGIC_VECTOR(255 downto 0);

		--utility
		clk 		: in STD_LOGIC;
		reset_n 	: in STD_LOGIC
		
--		--reduncies 
--        CLK_flag : out STD_LOGIC;
--        program_c_r : out STD_LOGIC_VECTOR (7 downto 0); --debugging
--        ALU_R_r     : out STD_LOGIC_VECTOR (255 downto 0)
	);
end exponentiation;

architecture behavior of exponentiation is
    signal temp_A : STD_LOGIC_VECTOR (255 downto 0);
    signal temp_B : STD_LOGIC_VECTOR (255 downto 0);
    signal ALU_select_instr_temp : STD_LOGIC_VECTOR (3 downto 0);
    signal temp_ALU_output : STD_LOGIC_VECTOR (255 downto 0);
    signal temp_CMP_flag : STD_LOGIC;
begin
i_ALU : entity work.ALU
    
    port map (
        ALU_select_instr => ALU_select_instr_temp,
        ALU_output    => temp_ALU_output ,
        CMP_FLAG   => temp_CMP_flag ,
        A => temp_A,
        B => temp_B
    );

i_CTRL : entity work.Control
    
    port map (
        key_ed => key,
        clk => clk,
        reset_n => reset_n,
        key_n => modulus,
        msgin_data => message,
        msgin_valid => valid_in, 
        CMP_flag => temp_CMP_flag,
        ALU_R => temp_ALU_output,
        --CLK_flag => CLK_flag,
        A => temp_A,
        B  => temp_B,
        msgout_valid => valid_out,
        msgout_data  => result,
        ALU_inst => ALU_select_instr_temp,
        ready_out => ready_out,
        ready_in => ready_in
        --program_c_r => program_c_r,
        --ALU_R_r     => ALU_R_r
    );

end 
behavior

;




--architecture expBehave of exponentiation is
--begin
----	result <= message xor modulus;
--	ready_in <= '1';
----	valid_out <= valid_in;
--end expBehave;
