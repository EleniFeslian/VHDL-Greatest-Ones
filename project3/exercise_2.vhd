----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.01.2021 17:56:09
-- Design Name: 
-- Module Name: exercise_2 - beh_ex2
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

entity exercise_2 is
  Port (    a : in std_logic_vector (3 downto 0);
            b : in std_logic_vector (3 downto 0);
            c : in std_logic_vector (3 downto 0);
            d : in std_logic_vector (3 downto 0);
          clk : in std_logic;
        reset : in std_logic;
     greatest : out std_logic_vector (3 downto 0);
         ones : out std_logic_vector (3 downto 0)
        );
end exercise_2;

architecture beh_ex2 of exercise_2 is

signal         temp_a : std_logic_vector (3 downto 0);
signal         temp_b : std_logic_vector (3 downto 0);
signal         temp_c : std_logic_vector (3 downto 0);
signal         temp_d : std_logic_vector (3 downto 0); 
signal         max_ab : std_logic_vector (3 downto 0);
signal         save_c : std_logic_vector (3 downto 0);
signal         save_d : std_logic_vector (3 downto 0);
signal    save_max_ab : std_logic_vector (3 downto 0);
signal        max_abc : std_logic_vector (3 downto 0);
signal   save_max_abc : std_logic_vector (3 downto 0);
signal       max_abcd : std_logic_vector (3 downto 0);
signal     count_ones : std_logic_vector (3 downto 0);

begin

reg0: process(clk,reset) is
begin
 if reset='1' then
    temp_a<=(others=>'0');
    temp_b<=(others=>'0');
    temp_c<=(others=>'0');
    temp_d<=(others=>'0');
 elsif clk='1' and clk'event then
    temp_a<=a;
    temp_b<=b;
    temp_c<=c;
    temp_d<=d;
 end if;
end process reg0;

max_ab<= a when a>b else b;

reg1: process(clk,reset) is 

begin

   if reset='1' then
      save_max_ab<=(others=>'0');
      save_c<=(others=>'0');
      save_d<=(others=>'0');
   elsif (clk='1' and clk'event) then
      save_max_ab<=max_ab;
      save_c<=c;
      save_d<=d;
   end if;   

end process reg1;

max_abc<=save_c when save_c>save_max_ab else save_max_ab;

reg2: process(clk,reset) is

begin

   if reset='1' then
      save_d<=(others=>'0');
      save_max_abc<=(others=>'0');
   elsif (clk='1' and clk'event) then
      save_d<=save_d;
      save_max_abc<=max_abc;
   end if;


end process reg2;

max_abcd<= save_d when save_d>save_max_abc else save_max_abc;

reg3: process(clk) is

begin

   if reset='1' then
      greatest<=(others=>'0');
   elsif (clk='1' and clk'event) then
      greatest<=max_abcd;
   end if;

end process reg3;  

count_ones<="0000" when max_abcd="0000" else
            "0111" when max_abcd="1111" else 
            "0001" when max_abcd="0001" else
            "0001" when max_abcd="0010" else
            "0001" when max_abcd="0100" else
            "0001" when max_abcd="1000" else
            "0010" when max_abcd="0011" else
            "0010" when max_abcd="0101" else
            "0010" when max_abcd="1001" else
            "0010" when max_abcd="0110" else
            "0010" when max_abcd="1010" else
            "0010" when max_abcd="1100" else
            "0011" when max_abcd="0111" else
            "0011" when max_abcd="1011" else 
            "0011" when max_abcd="1101" else
            "0011" when max_abcd="1110";
            

reg4: process(clk, reset) is

begin

   if reset='1' then
      ones<=(others=>'0');
   elsif (clk='1' and clk'event) then
      ones<=count_ones;
   end if;

end process reg4;

end beh_ex2;