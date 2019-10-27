----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2019 15:05:39
-- Design Name: 
-- Module Name: MUX_tb - Behavioral
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
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MUX_tb is
end;

architecture bench of MUX_tb is

  component MUX
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
  end component;

  signal A: STD_LOGIC_VECTOR (255 downto 0);
  signal B: STD_LOGIC_VECTOR (255 downto 0);
  signal C: STD_LOGIC_VECTOR (255 downto 0);
  signal D: STD_LOGIC_VECTOR (255 downto 0);
  signal E: STD_LOGIC_VECTOR (255 downto 0);
  signal F: STD_LOGIC_VECTOR (255 downto 0);
  signal G: STD_LOGIC_VECTOR (255 downto 0);
  signal H: STD_LOGIC_VECTOR (255 downto 0);
  signal I: STD_LOGIC_VECTOR (255 downto 0);
  signal J: STD_LOGIC_VECTOR (255 downto 0);
  signal K: STD_LOGIC_VECTOR (255 downto 0);
  signal L: STD_LOGIC_VECTOR (255 downto 0);
  signal sel: STD_LOGIC_VECTOR (3 downto 0);
  signal Output: STD_LOGIC_VECTOR (255 downto 0);
    signal x1 : STD_LOGIC_VECTOR (240 downto 0) := (others => '0');


begin

  uut: MUX port map ( A      => A,
                      B      => B,
                      C      => C,
                      D      => D,
                      E      => E,
                      F      => F,
                      G      => G,
                      H      => H,
                      I      => I,
                      J      => J,
                      K      => K,
                      L      => L,
                      sel    => sel,
                      Output => Output );

  stimulus: process
  begin
  
    -- Put initialisation code here
    A <= x1 & "000000000000001";
    B <= x1 & "000000000000010";
    C <= x1 & "000000000000100";
    D <= x1 & "000000000001000";
    E <= x1 & "000000000010000";
    F <= x1 & "000000000100000";
    G <= x1 & "000000001000000";
    H <= x1 & "000000010000000";
    I <= x1 & "000000100000000";
    J <= x1 & "000001000000000";
    K <= x1 & "000010000000000";
    L <= x1 & "000100000000000";
       

    -- Put test bench stimulus code here
    sel <= "0000";
    wait for 10 ns;
    sel <= "0001";
    wait for 10 ns;
    sel <= "0010";
    wait for 10 ns;
    sel <= "0011";
    wait for 10 ns;
    sel <= "0100";
    wait for 10 ns;
    sel <= "0101";
    wait for 10 ns;
    sel <= "0110";
    wait for 10 ns;
    sel <= "0111";
    wait for 10 ns;
    sel <= "1000";
    wait for 10 ns;
    sel <= "1001";
    wait for 10 ns;
    sel <= "1010";
    wait for 10 ns;
    sel <= "1011";
    wait for 10 ns;

    wait;
  end process;


end;
