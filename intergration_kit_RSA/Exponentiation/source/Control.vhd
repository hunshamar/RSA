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
           --CLK_flag : out STD_LOGIC; --
           key_n : in STD_LOGIC_VECTOR (255 downto 0);
           msgin_data : in STD_LOGIC_VECTOR (255 downto 0);
           msgin_valid : in STD_LOGIC;
           CMP_flag : in STD_LOGIC;
           ALU_R : in STD_LOGIC_VECTOR (258 downto 0);
           A : out STD_LOGIC_VECTOR (258 downto 0);
           B : out STD_LOGIC_VECTOR (258 downto 0);
           msgout_valid : out STD_LOGIC;
           msgout_data : out STD_LOGIC_VECTOR (255 downto 0);
           ALU_inst : out STD_LOGIC_VECTOR (3 downto 0);
           ready_in : out STD_LOGIC;
           ready_out : in STD_LOGIC);
           --program_c_r : out STD_LOGIC_VECTOR (7 downto 0);
           --ALU_R_r     : out STD_LOGIC_VECTOR (255 downto 0));
end Control;



architecture Behavioral of Control is

--registers
signal ed_reg : std_logic_vector(258 downto 0);
signal n_reg : std_logic_vector(258 downto 0);
signal m_reg : std_logic_vector(258 downto 0);
signal c_reg : std_logic_vector(258 downto 0);
signal a_reg : std_logic_vector(258 downto 0);
signal b_reg : std_logic_vector(258 downto 0);
signal R_reg : std_logic_vector(258 downto 0);
signal i_reg : std_logic_vector(258 downto 0);
signal j_reg : std_logic_vector(258 downto 0);
signal k_reg : std_logic_vector(258 downto 0);
signal T1_reg : std_logic_vector(258 downto 0);
signal T2_reg : std_logic_vector(258 downto 0);
--signal ALU_R_reg  : std_logic_vector(255 downto 0); no signals with initial values use reset to initialize
signal write_signal : std_logic_vector(3 downto 0);
signal program_counter : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal jmp : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal blakley_2 : std_logic := '0';
signal blakley_2_next : std_logic;
signal msgout_valid_next : std_logic := '0';
signal ready_in_next : std_logic := '1';

constant redundant : STD_LOGIC_VECTOR (258 downto 0) := (others => '0');
--constant x1 : STD_LOGIC_VECTOR (247 downto 0) := (others => '0');
--constant x2 : STD_LOGIC_VECTOR (239 downto 0) := (others => '0');

begin


    process (clk, reset_n)
    begin 
        if (reset_n = '0') then
            --ready_in <= '1';
            --CLK_flag <= '0';
            ready_in <= '1';
            msgout_valid <= '0';
            --program_c_r <= program_counter;
            
            --ALU_output <= (others => '0');
        elsif (clk'event and clk = '1' ) then
            msgout_valid <= msgout_valid_next;
            ready_in <= ready_in_next;
            blakley_2 <= blakley_2_next;
            --CLK_flag <= '1';
            if (jmp = "00000000") then 
                program_counter <= program_counter+1;
            else 
                program_counter <= jmp;            
            end if;
                
            --program_c_r <= program_counter;
            --ALU_R_r <= ALU_R;
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
    
process(key_ed, key_n, msgin_data, msgin_valid, CMP_flag, ALU_R, program_counter, ready_in, ready_out)
    begin
           ed_reg <= "000" & key_ed;
           n_Reg <= "000" & key_n;
           m_reg <= "000" & msgin_data;
           msgout_data  <= C_reg(255 downto 0);
           
            
        
    
    --msgout_data <= (others => '1');
        if (msgin_valid = '1' AND ready_in = '1') then

           ready_in_next <= '0';
           jmp <= "00000010";
            
           write_signal <= "1111";
           A <= redundant;
           B <= redundant;
           ALU_inst <= "1111";
           
        else
--        elsif (ready_in = '0') then
--           write_signal <= "1111";
--           A <= redundant;
--           B <= redundant;
--           ALU_inst <= "1111";
--           jmp <= "00000000";
        
            case program_counter is
            
--                when "00000011" => --blakely
--                  --n_reg <= x1 & "00000100";    
--                  --msgout_valid <= '1';
--                  write_signal <= "0111"; -- No_reg
--                  --A <= a_reg;
--                  ALU_inst <= "1010"; 
                  
                 when "00000001" =>
                    -- mean msgin not ready and valid
                    jmp <= "00000001";
                    write_signal <= "1111";
                    A <= redundant;
                    B <= redundant;
                    ready_in_next <= '1';
                    ALU_inst <= "1111";
                  
                 when "00000011" =>
                    -- ready_in <= '0'; -- i guess
                    jmp <= "00000000";
                    A <= redundant;
                    B <= redundant;
                    write_signal <= "0111";
                    ready_in_next <= '0'; 
                    ALU_inst <= "1010"; --ret 255;
                    
                
                when "00000100" =>
                    jmp <= "00000000";
                    A <= ed_reg;
                    B <= i_reg;
                    ALU_inst <= "0011"; --ret bit B from A
                    write_signal <= "1111";
                    ready_in_next <= '0';
                
                when "00000101" =>
                    jmp <= "00000000";
                    write_signal <= "0011"; -- C_reg
                    A <= M_reg;
                    B <= redundant;
                    if CMP_flag = '1' then
                        ALU_inst <= "0111"; --ret_A
                    else
                        ALU_inst <= "1001"; --ret 1
                    end if;
                    ready_in_next <= '0';
                
                when "00000110" =>
                    jmp <= "00000000";
                   
                    A <= redundant;
                    B <= redundant;
                    write_signal <= "1010"; --T1
                    ALU_inst <= "1000"; --ret 0
                    ready_in_next <= '0';
                   
                   
               when "00000111" => -- all it does is set bl2 to 0
                    A <= redundant;
                    B <= redundant;
                    write_signal <= "1111";
                    ALU_inst <= "1111";
                   --blakley_2 <= '0';
                   jmp <= "00000000";
                   ready_in_next <= '0';
                   
                when "00001000" =>
                   write_signal <= "1111"; --no write
                   A <= i_reg;
                   B <= T1_reg;
                   ALU_inst <= "0100"; --cmp A== B
                   if cmp_flag = '1' then
                      jmp <= "10100001";  -- jump to end of loop
                   else 
                      jmp <= "10000001"; --enter loop
                   end if;
                   ready_in_next <= '0';
                   
                 
                when "10000001" =>
                    jmp <= "00000000";
                    write_signal <= "0111"; --i_reg
                    A <= i_reg;
                    B <= redundant;
                    ALU_inst <= "0101"; -- decrement i
                    ready_in_next <= '0';
                    
                    
                when "10000010" =>
                    jmp <= "00000000";
                    write_signal <= "1111"; --no write
                    A <= C_reg;
                    B <= redundant;
                    ALU_inst <= "0111"; -- RetA
                    --jmp <= "00000111";
                    ready_in_next <= '0';
                when "10000011" =>
                    jmp <= "00000000";
                    write_signal <= "1111"; --no write
                    A <= ed_reg;
                    B <= redundant;
                    ALU_inst <= "0111"; -- RetA
                    ready_in_next <= '0';
                    --jmp <= "00000111";    
                 when "10000100" =>
                    jmp <= "00000000";
                    write_signal <= "0100"; --a_reg
                    A <= C_reg;
                    B <= redundant;
                    ALU_inst <= "0111"; -- RetA
                    ready_in_next <= '0';
                    --jmp <= "00000111";   
                 when "10000101" =>
                    write_signal <= "0101"; --b_reg
                    A <= C_reg;
                    B <= redundant;
                    ALU_inst <= "0111"; -- RetA
                    jmp <= "01000110"; -- run blakely 1
                    ready_in_next <= '0';
                       
                       
                 when "10000110" => --Blakely 2
                    A <= redundant;
                    B <= redundant;
                    ALU_inst <= "1111"; 
                    write_signal <= "1111";
                    
                    jmp <= "00000000";
                    --blakley_2 <= '1';
                    --msgout_data <= x1 & "11111110";
                    ready_in_next <= '0';
                    
--                when "10000111" => 
--                    --jmp <= "01101100";
--                    msgout_data <= x1 & "00000000";
                    
                when "10000111" => --blakley check
                    A <= ed_reg;
                    B <= i_reg;
                    ALU_inst <= "0011"; --return bit b from A
                    write_signal <= "1111"; --no write
                    if CMP_flag = '1' then
                        jmp <= "00000000"; --continue
                        --msgout_data <=  i_Reg;
                    else 
                        jmp <= "00000111"; --dont do blakley 2       
                        --msgout_data <=  x1 & "00000000";         
                    end if;
                    ready_in_next <= '0';
                    
               when "10001000" =>
                    jmp <= "00000000";
                   -- msgout_data <= x1 & "00000000";
                    write_signal <= "0100"; --a_reg
                    A <= C_reg;
                    B <= redundant;
                    ALU_inst <= "0111"; -- RetA
                    ready_in_next <= '0';
                 when "10001001" =>
                    write_signal <= "0101"; --b_reg
                    A <= M_reg;
                    B <= redundant;
                    ALU_inst <= "0111"; -- RetA
                    jmp <= "01000110"; -- run blakely 1
                    ready_in_next <= '0';
                    

                when "01000110" => --blakely 
                  jmp <= "00000000";
                  --n_reg <= x1 & "00000100";    
                  --msgout_valid <= '1';
                  write_signal <= "1111"; -- No_reg
                  A <= a_reg;
                  B <= redundant;
                  ALU_inst <= "0111";    
                  ready_in_next <= '0';    
                    
                    
                         
                when "01000111" =>
                    jmp <= "00000000";
                --msgout_valid <= '0';
                    A <= redundant;
                    B <= redundant;
                  ALU_inst <= "1000"; --return 0
                  write_signal <= "0110"; --R_Reg
                  ready_in_next <= '0';
                when "01001000" =>
                    jmp <= "00000000";
                    A <= redundant;
                    B <= redundant;
                  ALU_inst <= "1000"; --return 0
                  write_signal <= "1000"; --j_reg
                  ready_in_next <= '0';
                when "01001001" =>
                    jmp <= "00000000";
                    A <= redundant;
                    B <= redundant;
                  ALU_inst <= "1010"; --return 255
                  write_signal <= "1001"; --k_reg
                  ready_in_next <= '0';
                when "01001010" =>
                    jmp <= "00000000";
                    A <= redundant;
                    B <= redundant;
                  ALU_inst <= "1010"; --return 255
                  write_signal <= "1011"; -- T2_reg
                  ready_in_next <= '0';
                when "01001011" =>
                    jmp <= "00000000";
                    A <= redundant;
                    B <= redundant;
                  A <= T2_reg;
                  ALU_inst <= "0110"; --increment by 1;
                  write_signal <= "1011"; -- T2_reg
                  ready_in_next <= '0';
                  
                when "01001100" =>
                  jmp <= "00000000";
                    A <= redundant;
                    B <= redundant;
                    ALU_inst <= "1111";
                    write_signal <= "1111";
                    ready_in_next <= '0';
                  
                when "01001101" =>
                  write_signal <= "1111"; -- No_reg
                  A <=  j_reg;
                  B <=  T2_reg;
                  ALU_inst <= "0100"; -- comp_registers_A_B
                  if CMP_flag = '1' then
                    jmp <= "01101100"; -- jmp past loop
                  else
                    jmp <= "00000000";
                  end if;
                  ready_in_next <= '0';           
                  
                when "01001110" => 
                    jmp <= "00000000"; 
                   write_signal <= "1111"; -- No_reg
                    A <= a_reg;
                    B <= k_reg;
                    ALU_inst <= "0011"; -- return bit B from A
                    ready_in_next <= '0';
--                   
                when "01001111" => 
                    jmp <= "00000000";
                    
                    A <= R_reg;
                    B <= b_reg;
                    write_signal <= "0110"; --R_reg
                   
                    if CMP_flag = '1' then
                        --msgout_valid <= '1';
                        ALU_inst <= "0010"; -- left_shift__A_and_add_B
                    else 
                        ALU_inst <= "0001"; --left shift A
                    end if;
                    ready_in_next <= '0';
                    
                when "01010000" => 
                    jmp <= "00000000";
                    --msgout_valid <= '0';
                    A <= R_Reg;
                    B <= n_reg;
                    ALU_inst <= "0000";
                    write_signal <= "0110"; -- R_reg
                    ready_in_next <= '0';
                when "01010001" => 
                    jmp <= "00000000";
                    A <= R_Reg;
                    B <= n_reg;
                    ALU_inst <= "0000";
                    write_signal <= "0110"; -- R_reg
                    ready_in_next <= '0';
                    
                when "01010010" =>  ----
                    jmp <= "00000000";
                    A <= k_reg;
                    B <= redundant;
                    ALU_inst <= "0101"; --decrement
                    write_signal <= "1001"; -- k_reg
                    ready_in_next <= '0';
                    
                when "01010011" => 
                    A <= j_reg;
                    B <= redundant;
                    ALU_inst <= "0110"; --increment
                    write_signal <= "1000"; -- j_reg
                    jmp <= "01001100";
                    ready_in_next <= '0';
                  
                when "01101100" => -- after while
                    write_signal <= "0011"; -- C reg
                    if blakley_2 = '0' then
                        jmp <= "10000110"; --do second
                    else
                        jmp <= "00000111"; --done with second. back to start. 
                    end if;
                    A <= R_reg;
                    B <= redundant;
                    ALU_inst <= "0111"; 
                    --msgout_valid <= '1';
                    ready_in_next <= '0';
                  
                  
                
                when "10100001" =>
                 write_signal <= "1111"; -- no reg
                    --done
                    A <= C_reg;
                    B <= redundant;
                    ALU_inst <= "0111"; 
                    jmp <= "10100001";
                    if (ready_out='1' and msgout_valid='1') then
                        ready_in_next <= '1';
                    else
                        ready_in_next <= '0';
                    end if;
                   
                  
                when others => 
                    jmp <= "00000000"; --jmp;
                    --jmp <= "00000000";  --wtfff
                    write_signal <= "1111";
                    A <= redundant;
                    B <= redundant;
                    ALU_inst <= "1111";
                    ready_in_next <= '0';
--                msgout_data <= (others => '1');
--                msgout_valid <= '1';
                    -- nothing
            end case;
--         else
--           write_signal <= "1111";
--           A <= redundant;
--           B <= redundant;
--           ALU_inst <= "1111";
--           jmp <= "00000000";
         end if;--ready_in='0'        
                    
            -- do nothing
     
    
    end process;
    
    
    
    process (program_counter)
    begin
        if program_counter = "10100001" then
            msgout_valid_next <= '1';
            --ready_in_next <= '1';
        else
            msgout_valid_next <= '0';
            --ready_in_next <= '0';
        end if;
        
        if program_counter = "00000111" then
            blakley_2_next <= '0';
        elsif program_counter = "10000110" then
            blakley_2_next <= '1';
        else
            blakley_2_next <= blakley_2;
        end if;
        
    end process;
    
--    process (program_counter)
--    begin
--        if program_counter = "10000110" 
--        or program_counter = "10000111" then
--            msgout_valid_next <= '1';
--        else
--            jmp_next <= "00000000";
--        end if;
--    end process;

end Behavioral;