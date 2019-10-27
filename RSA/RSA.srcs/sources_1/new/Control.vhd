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
--signal ALU_R_reg  : std_logic_vector(255 downto 0);
signal write_signal : std_logic_vector(3 downto 0);
signal x1 : STD_LOGIC_VECTOR (247 downto 0) := (others => '0');
signal x2 : STD_LOGIC_VECTOR (239 downto 0) := (others => '0');
signal program_counter : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal jmp : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');

begin


    process (clk, reset_n, program_counter, write_signal, b_reg)
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
            --case write_signal is
            
            case write_signal is
                when "0011" =>
                    C_reg <= ALU_R;
                when "0100" =>
                    a_reg <= ALU_R;
                when "0101" =>
                    b_reg <= ALU_R;
                when "0110" =>
                    R_Reg <= ALU_R;
                when "0111" =>
                    i_reg <= ALU_R;
                when "1000" =>
                    j_reg <= ALU_R;
                when "1001" =>
                    k_reg <= ALU_R;
                when "1010" =>
                    T1_reg <= ALU_R;
                when "1011" =>
                    T2_reg <= ALU_R;
                when others => 
    --              -- do nothing
                end case;
        end if;
  
end process;
    
process(key_ed, key_n, msgin_data, msgin_valid, CMP_flag, ALU_R, program_counter)
    begin
    --msgout_data <= (others => '1');
        if (msgin_valid = '1') then
           
--           ed_reg <= key_ed;
--           n_Reg <= key_n;
--           m_reg <= msgin_data;
           
           
           
           
            case program_counter is
                when "00000011" =>
                  ed_reg <= x2 & "0010011100010000"; --a
                  A <= ed_reg;
                  ALU_inst <= "0111"; --ret A
                  write_signal <= "0100";
                  
                when "00000100" =>
                  m_reg <= x2 & "0000000100101100"; -- b
                  A <= m_reg;
                  ALU_inst <= "0111"; --ret A
                  write_signal <= "0101";
                  
                when "00000101" =>
                  n_reg <= x2 & "0000110010100001"; --n
                  write_signal <= "1111";
                when "00000110" => --blakely
                  --n_reg <= x1 & "00000100";    
                  msgout_valid <= '1';
                  write_signal <= "1111"; -- No_reg
                  A <= a_reg;
                  ALU_inst <= "0111";        
                    
                    
                         
                when "00000111" =>
                msgout_valid <= '0';
                  ALU_inst <= "1000"; --return 0
                  write_signal <= "0110"; --R_Reg
                when "00001000" =>
                  ALU_inst <= "1000"; --return 0
                  write_signal <= "1000"; --j_reg
                when "00001001" =>
                  ALU_inst <= "1010"; --return 255
                  write_signal <= "1001"; --k_reg
                when "00001010" =>
                  ALU_inst <= "1010"; --return 255
                  write_signal <= "1011"; -- T2_reg
                when "00001011" =>
                  A <= T2_reg;
                  ALU_inst <= "0110"; --increment by 1;
                  write_signal <= "1011"; -- T2_reg
                when "00001100" =>
                  jmp <= "00000000";
                when "00001101" =>
                  write_signal <= "1111"; -- No_reg
                  A <=  j_reg;
                  B <=  T2_reg;
                  ALU_inst <= "0100"; -- comp_registers_A_B
                  if CMP_flag = '1' then
                    jmp <= "10001100"; -- jmp past loop
                  end if;           
                  
                when "00001110" =>  
                   write_signal <= "1111"; -- No_reg
                    A <= a_reg;
                    B <= k_reg;
                    ALU_inst <= "0011"; -- return bit B from A
--                   
                when "00001111" => 
                    
                    A <= R_reg;
                    B <= b_reg;
                    write_signal <= "0110"; --R_reg
                   
                    if CMP_flag = '1' then
                        msgout_valid <= '1';
                        ALU_inst <= "0010"; -- left_shift__A_and_add_B
                    else 
                        ALU_inst <= "0001"; --left shift A
                    end if;
                    
                when "00010000" => 
                    msgout_valid <= '0';
                    A <= R_Reg;
                    B <= n_reg;
                    ALU_inst <= "0000";
                    write_signal <= "0110"; -- R_reg
                when "00010001" => 
                    A <= R_Reg;
                    B <= n_reg;
                    ALU_inst <= "0000";
                    write_signal <= "0110"; -- R_reg
                    
                when "00010010" =>  ----
                    A <= k_reg;
                    ALU_inst <= "0101"; --decrement
                    write_signal <= "1001"; -- k_reg
                    
                when "00010011" => 
                    A <= j_reg;
                    ALU_inst <= "0110"; --increment
                    write_signal <= "1000"; -- j_reg
                    jmp <= "00001100";
                  
                when "10001100" => -- after while
                    write_signal <= "1111"; -- no reg
                    jmp <= "00000000";
                    A <= R_reg;
                    ALU_inst <= "0111"; 
                  msgout_valid <= '1';
                  
                  
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
