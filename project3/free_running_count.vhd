----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.01.2021 22:55:23
-- Design Name: 
-- Module Name: free_running_count - beh_frc
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

entity free_running_count is
  Port ( clk: in std_logic;
         ctrl:out std_logic
        );
end free_running_count;

architecture beh_frc of free_running_count is
signal count_val: unsigned(4 downto 0);

begin

free_counter: process(clk) is
begin
 
  if rising_edge(clk) then
     count_val<= count_val + 1;
  end if;

end process free_counter;

ctrl<= '1' when count_val = "00011" or 
                count_val = "10011" or
                count_val = "10111" else '0';  

end beh_frc;
