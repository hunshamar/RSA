----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2019 14:57:12
-- Design Name: 
-- Module Name: 12-1_MUX - Behavioral
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

entity MUX is
    Port ( A : in STD_LOGIC_VECTOR (255 downto 0);
           B : in STD_LOGIC_VECTOR (255 downto 0);
           C : in STD_LOGIC_VECTOR (255 downto 0);
           D : in STD_LOGIC_VECTOR (255 downto 0);
           E : in STD_LOGIC_VECTOR (255 downto 0);
           F : in STD_LOGIC_VECTOR (255 downto 0);
           G : in STD_LOGIC_VECTOR (255 downto 0);
           H : in STD_LOGIC_VECTOR (255 downto 0);
           I : in STD_LOGIC_VECTOR (255 downto 0);
           J : in STD_LOGIC_VECTOR (255 downto 0);
           K : in STD_LOGIC_VECTOR (255 downto 0);
           L : in STD_LOGIC_VECTOR (255 downto 0);
           sel : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (255 downto 0));
end MUX;

architecture Behavioral of MUX is

begin   

p_mux : process(A,B,C,D,E,F,G,H,I,J,K,L,sel)
begin
    case sel is
        when "0000" => output <= A ; 
        when "0001" => output <= B ;
        when "0010" => output <= C ;
        when "0011" => output <= D ;
        when "0100" => output <= E ;
        when "0101" => output <= F ;
        when "0110" => output <= G ;
        when "0111" => output <= H ;
        when "1000" => output <= I ;
        when "1001" => output <= J ;
        when "1010" => output <= K ;
        when "1011" => output <= L ;
        when others => output <= (others => '0');
    end case;
end process p_mux;


end Behavioral;
