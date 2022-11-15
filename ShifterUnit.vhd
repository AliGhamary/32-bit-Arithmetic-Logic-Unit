----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2021 03:34:12 PM
-- Design Name: 
-- Module Name: ShifterUnit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ShifterUnit is
    Port ( A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           direction : in STD_LOGIC;
           op_type : in STD_LOGIC;
           shiftout : out STD_LOGIC_VECTOR(15 downto 0));
end ShifterUnit;

architecture Behavioral of ShifterUnit is
signal A2:  STD_LOGIC_VECTOR(15 downto 0);
signal B2 :  integer;
begin

process(direction,op_type) begin

B2<=conv_integer(B);
if (op_type ='0' and direction = '0') then
 A2<= std_logic_vector(unsigned(A) sll B2);
    elsif(op_type ='0' and direction ='1') then
     A2<= std_logic_vector(unsigned(A) srl B2);
     elsif(op_type ='1' and direction ='0') then
     A2<= std_logic_vector(unsigned(A) rol B2);
     elsif(op_type ='0' and direction ='1') then
     A2<= A+1;
 end if; 
 
 shiftout<=A2;
 
end process;
end behavioral;

