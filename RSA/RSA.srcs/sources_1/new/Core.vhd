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
    Port ( --Core input and outputs
           key_ed : in STD_LOGIC_VECTOR (255 downto 0);
           key_n : in STD_LOGIC_VECTOR (255 downto 0);
           msgin_data : in STD_LOGIC_VECTOR (255 downto 0);
           msgin_valid : in STD_LOGIC;
           msgout_data : out STD_LOGIC_VECTOR (255 downto 0);
           msgout_valid : out STD_LOGIC;
           program_c_r : out STD_LOGIC_VECTOR (7 downto 0);
           ALU_R_r     : out STD_LOGIC_VECTOR (255 downto 0);
           
           
--            -- ALU inputs
--            A : in STD_LOGIC_VECTOR (255 downto 0);
--            B : in STD_LOGIC_VECTOR (255 downto 0);
--            ALU_select_instr : in STD_LOGIC_VECTOR (3 downto 0);
        
--            --ALU outputs
--            ALU_output: out STD_LOGIC_VECTOR (255 downto 0);
--            CMP_FLAG : out STD_LOGIC;
             
--             --Control inputs
  --          c_key_ed : in STD_LOGIC_VECTOR (255 downto 0);
            clk : in STD_LOGIC; --
            reset_n : in STD_LOGIC; --
 --           c_key_n : in STD_LOGIC_VECTOR (255 downto 0);
--           c_msgin_data : in STD_LOGIC_VECTOR (255 downto 0);
--           c_msgin_valid : in STD_LOGIC;
--           c_CMP_flag : in STD_LOGIC;
--           ALU_R : in STD_LOGIC_VECTOR (255 downto 0);
           
--           --Control outputs
            CLK_flag : out STD_LOGIC 
--           A_out : out STD_LOGIC_VECTOR (255 downto 0);
--           B_out : out STD_LOGIC_VECTOR (255 downto 0);
--           c_msgout_valid : out STD_LOGIC;
--           c_msgout_data : out STD_LOGIC_VECTOR (255 downto 0);
--           ALU_inst : out STD_LOGIC_VECTOR (3 downto 0)
           );
end Core;

    
architecture behavoir of Core is
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
        key_ed => key_ed,
        clk => clk,
        reset_n => reset_n,
        key_n => key_n,
        msgin_data => msgin_data,
        msgin_valid => msgin_valid, 
        CMP_flag => temp_CMP_flag,
        ALU_R => temp_ALU_output,
        CLK_flag => CLK_flag,
        A => temp_A,
        B  => temp_B,
        msgout_valid => msgout_valid,
        msgout_data  => msgout_data,
        ALU_inst => ALU_select_instr_temp,
        program_c_r => program_c_r,
        ALU_R_r     => ALU_R_r
    );

end behavoir;

    