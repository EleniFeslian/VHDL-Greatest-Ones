----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.01.2021 18:15:20
-- Design Name: 
-- Module Name: exercise_2_tb - beh_exercise_2_tb
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity exercise_2_tb is
--  Port ( );
end exercise_2_tb;


architecture beh_ex_2_tb of exercise_2_tb is

component exercise_2 is
    Port ( a : in std_logic_vector  (3 downto 0);
           b : in std_logic_vector  (3 downto 0);
           c : in std_logic_vector  (3 downto 0);
           d : in std_logic_vector  (3 downto 0);
         clk : in std_logic;
       reset : in std_logic;             
    greatest : out std_logic_vector (3 downto 0);
        ones : out std_logic_vector (3 downto 0)
         );
end component exercise_2;

signal         a :  std_logic_vector  (3 downto 0);   
signal         b :  std_logic_vector  (3 downto 0);   
signal         c :  std_logic_vector  (3 downto 0);   
signal       clk :  std_logic;
signal     reset :  std_logic;  
signal         d :  std_logic_vector  (3 downto 0); 
signal  greatest :  std_logic_vector  (3 downto 0);
signal      ones :  std_logic_vector  (3 downto 0);

constant clk_period : time := 10.000 ns;

begin

uut: exercise_2 port map (a,b,c,d,clk,reset,greatest,ones);

clk_process : process is
    begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
end process clk_process;

test: process is

begin
reset <= '1';
wait for 100 ns;
wait until (clk = '1' and clk'event);
reset <= '0';

--all possible combinations

for i in 0 to 15 loop
    a<=std_logic_vector(to_unsigned(i,a'length));
    for x in 0 to 15 loop
        b<=std_logic_vector(to_unsigned(x,b'length));
        for y in 0 to 15 loop
            c<=std_logic_vector(to_unsigned(y,c'length));
            for z in 0 to 15 loop
                d<=std_logic_vector(to_unsigned(i,d'length));
            end loop;
        end loop;
    end loop;
end loop;

end process test;

end beh_ex_2_tb;
