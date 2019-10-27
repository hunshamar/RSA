----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2019 16:43:36
-- Design Name: 
-- Module Name: Control - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Control is
    Port ( key_ed : in STD_LOGIC_VECTOR (255 downto 0);
           clk : in STD_LOGIC; --
           reset_n : in STD_LOGIC; --
           CLK_flag : out STD_LOGIC; --
           key_n : in STD_LOGIC_VECTOR (255 downto 0);
           msgin_data : in STD_LOGIC_VECTOR (255 downto 0);
           msgin_valid : in STD_LOGIC;
           CMP_flag : in STD_LOGIC;
           ALU_R : in STD_LOGIC_VECTOR (255 downto 0);
           A : out STD_LOGIC_VECTOR (255 downto 0);
           B : out STD_LOGIC_VECTOR (255 downto 0);
           msgout_valid : out STD_LOGIC;
           msgout_data : out STD_LOGIC_VECTOR (255 downto 0);
           ALU_inst : out STD_LOGIC_VECTOR (3 downto 0);
           program_c_r : out STD_LOGIC_VECTOR (7 downto 0);
           ALU_R_r     : out STD_LOGIC_VECTOR (255 downto 0));
end Control;



architecture Behavioral of Control is

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
signal x1 : STD_LOGIC_VECTOR (247 downto 0) := (others => '0');
signal program_counter : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal jmp : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');

begin


    process (clk, reset_n, program_counter)
    begin 
        if (reset_n = '0') then
            CLK_flag <= '0';
            --ALU_output <= (others => '0');
        elsif (clk'event and clk = '1' ) then
            CLK_flag <= '1';
            
            if (jmp = "00000000") then 
                program_counter <= program_counter+1;
            else 
                program_counter <= jmp;            
            end if;
                
            program_c_r <= program_counter;
            ALU_R_r <= ALU_R;
            --ALU_output <= ALU_result;
            --CMP_flag <= CMP_result;
        end if;
  
end process;
    
process(key_ed, key_n, msgin_data, msgin_valid, CMP_flag, ALU_R, program_counter)
    begin
    --msgout_data <= (others => '1');
        if (msgin_valid = '1') then
            
            case program_counter is
                when "00000100" =>
                  ed_reg <= key_ed;
                  n_reg <= key_n;
                  m_reg <= msgin_data;
                  ALU_inst <= "0001"; -- 
                  A <= key_ed;
--                m_reg <= ALU_R;
                msgout_data <= (others => '0');
                msgout_valid <= '1';
                
              

                when "00000101" =>
                  msgout_valid <= '0';
                  msgout_data <= ALU_R;
                  
                when "00000110" => --blakely
                  n_reg <= x1 & "00000100";
                  a_reg <= x1 & "00000101";
                  b_reg <= x1 & "00011110";              
                when "00000111" =>
                  ALU_inst <= "1000"; --return 0
                  R_reg <= ALU_R;
                when "00001000" =>
                  ALU_inst <= "1000"; --return 0
                  j_reg <= ALU_R;
                when "00001001" =>
                  ALU_inst <= "1010"; --return 255
                  k_reg <= ALU_R;
                when "00001010" =>
                  ALU_inst <= "1010"; --return 255
                  T2_reg <= ALU_R;
                when "00001011" =>
                  A <= T2_reg;
                  ALU_inst <= "0110"; --increment by 1;
                                      
                when "00001100" =>
                  ALU_inst <= "0111";
                  jmp <= "00000000";
                when "00001101" =>
                  A <= j_reg;
                  B <= T2_reg;
                  ALU_inst <= "0100"; -- comp_registers_A_B
                  if CMP_flag = '1' then
                    jmp <= "10001100"; -- jmp past loop
                  end if;           
                  
                when "00001110" =>  
                    A <= a_reg;
                    B <= k_reg;
                    ALU_inst <= "0011";
                    
                when "00001111" => 
                    if CMP_flag = '1' then
                        A <= R_reg;
                        B <= b_reg;
                        ALU_inst <= "0010"; -- left_shift__A_and_add_B
                        R_reg <= ALU_R;
                    else 
                        A <= R_Reg;
                        ALU_inst <= "0001"; --left shift A
                        R_reg <= ALU_R;
                    end if;
                when "00010000" => 
                    A <= R_Reg;
                    B <= n_reg;
                    ALU_inst <= "0000";
                    R_reg <= ALU_R;
                when "00010001" => 
                    A <= R_Reg;
                    B <= n_reg;
                    ALU_inst <= "0000";
                    R_reg <= ALU_R;
                when "00010010" => 
                    j_reg <= j_reg+1;
                    A <= j_reg;
                    ALU_inst <= "0111";
                    jmp <= "00001100";
                  
                when "10001100" => -- after while
                    jmp <= "00000000";
                    A <= R_reg;
                    ALU_inst <= "0111"; 
                
                when others => 
--                msgout_data <= (others => '1');
--                msgout_valid <= '1';
                    -- nothing
            end case;                      
        else
            -- do nothing
        end if;
    
    end process;

end Behavioral;
