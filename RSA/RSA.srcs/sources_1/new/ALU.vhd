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

entity ALU is
    Port ( 
           A : in STD_LOGIC_VECTOR (255 downto 0);
           B : in STD_LOGIC_VECTOR (255 downto 0);
           ALU_select_instr : in STD_LOGIC_VECTOR (3 downto 0);
           ALU_output: out STD_LOGIC_VECTOR (255 downto 0);
           CMP_FLAG : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

signal A_reg : std_logic_vector(255 downto 0);
signal B_reg : std_logic_vector(255 downto 0);

begin
    process(A,B,ALU_select_instr)
    begin
        A_reg <= A;
        B_reg <= B;
        case(ALU_select_instr) is
        when "0000" => -- conditional subtraction. If A >= B return A-B, else return A
            CMP_flag <= '0'; 
            if (A >= B) then
                ALU_output <= A-B;
            else
                ALU_output <= A;
            end if;        
        when "0001" => -- left shift A
            CMP_flag <= '0'; 
            ALU_output <= std_logic_vector(unsigned(A) sll 1); 
        when "0010" => -- left shift A and add B
            CMP_flag <= '0'; 
            ALU_output <= std_logic_vector(unsigned(A) sll 1) + B;  
        when "0011" => -- return bit B from A, A[B]
            CMP_flag <= A(5); --A(TO_integer(unsigned(B(7 downto 0))));
            ALU_output <= (others => '0');
        when "0100" => -- comp registers A and B, return 1 if eq
            ALU_output <= (others => '0');          
            if(to_integer(unsigned(A)) = to_integer(unsigned(B))) then
                CMP_flag <= '1'; 
            else
                CMP_flag <= '0'; 
            end if;
        when "0101" => -- decrement A
            CMP_flag <= '0'; 
            ALU_output<= A-1;
        when "0110" => -- increment A
            CMP_flag <= '0'; 
            ALU_output<= A+1;
        when "0111" => -- return data from A
            CMP_flag <= '0'; 
            ALU_output<= A;
        when "1000" =>  -- return 0
            CMP_flag <= '0'; 
            ALU_output <= (others => '0');
        when "1001" =>  -- return 1
            CMP_flag <= '0'; 
            ALU_output <= (0 => '1', others => '0');
        when "1010" =>  -- return 255
            CMP_flag <= '0'; 
            ALU_output <= (7 downto 0 => '1', others => '0');
        when others => 
            CMP_flag <= '0'; 
            ALU_output <= (others => '1');
     end case;
     end process;
            
end Behavioral;
