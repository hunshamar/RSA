----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2019 19:07:33
-- Design Name: 
-- Module Name: Core - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Core is
    Port ( key_ed : in STD_LOGIC_VECTOR (255 downto 0);
           key_n : in STD_LOGIC_VECTOR (255 downto 0);
           msgin_data : in STD_LOGIC_VECTOR (255 downto 0);
           msgin_valid : in STD_LOGIC;
           msgin_last : in STD_LOGIC;
           msgout_ready : in STD_LOGIC;
           msgin_ready : out STD_LOGIC;
           msgout_data : out STD_LOGIC_VECTOR (255 downto 0);
           msgout_valid : out STD_LOGIC;
           msgout_last : out STD_LOGIC);
end Core;

architecture Behavioral of Core is

    --registers
    signal ed_reg : std_logic_vector(255 downto 0);
    signal n_reg : std_logic_vector(255 downto 0);
    signal m_reg : std_logic_vector(255 downto 0);
    signal c_reg : std_logic_vector(255 downto 0);
    signal a_reg : std_logic_vector(255 downto 0);
    signal b_reg : std_logic_vector(255 downto 0);
    signal R_reg : std_logic_vector(255 downto 0);
    signal i_reg : std_logic_vector(255 downto 0);
    signal j_reg : std_logic_vector(255 downto 0);
    signal k_reg : std_logic_vector(255 downto 0);
    signal T1_reg : std_logic_vector(255 downto 0);
    signal T2_reg : std_logic_vector(255 downto 0);
    
    --Logic outputs
    signal write_enable : std_logic_vector(11 downto 0);
    signal ALU_inst : std_logic_vector(3 downto 0);
    signal A_mux : std_logic_vector(3 downto 0);
    signal B_mux : std_logic_vector(3 downto 0);
    
    --ALU outputs
    signal ALU_output : std_logic_vector(255 downto 0);
    signal CMP_flag : STD_LOGIC;
    
    
    
    
begin
    process(key_ed, msgin_valid)
    begin
    if (msgin_valid = '1') then
        ed_reg <= key_ed;
        n_reg <= key_n;
        m_reg <= msgin_data; 
        -- ALU with inst 1010 write to C_register, mux inputs redudant, set to zero for example. 
        
        
        
        
         
    else
        -- do nothing
    end if;   
    end process;

end Behavioral;
    
    
architecture ALU of Core is
begin
i_ALU : entity work.ALU
    
    port map (
        --clk   => msgin_data  ,
        --reset_n       => key_e_d     ,
        --A  => msgin_ready ,
        --B => msgout_ready,
        ALU_select_instr => ALU_inst,
        ALU_output    => ALU_output ,
        CMP_FLAG   => CMP_flag       ,
        --CLK_output       => clk      
    );

msgout_last  <= msgin_last;
end ALU;

    