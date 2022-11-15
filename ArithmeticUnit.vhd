----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2021 03:30:40 PM
-- Design Name: 
-- Module Name: ArithmeticUnit - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ArithmeticUnit is
    Port ( A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           op_sel : in STD_LOGIC_VECTOR(1 downto 0);
           arith_out : out STD_LOGIC_VECTOR(15 downto 0);
           cout : out STD_LOGIC);
end ArithmeticUnit;

architecture Behavioral of ArithmeticUnit is
signal temp:std_logic_vector(16 downto 0);
--signal temp2: integer;
begin 

--temp <=A(7 downto 0) * B (7 downto 0),arith_out<=temp(15 downto 0), cout<='0'
--when(op_sel ="00")
--else

--process (temp,A,B,op_sel) begin

--case op_sel is 
--when"00" => temp<= A(7 downto 0) * B (7 downto 0); arith_out<=temp(15 downto 0); cout<='0';
--when "01" => temp<=A + B; arith_out<=temp(15 downto 0); cout<=temp(16);
--when "10" => temp<=A - B; arith_out<=temp(15 downto 0); cout<=temp(16);
--when "11" => temp<=A + 1; arith_out<=temp(15 downto 0); cout<=temp(16);
--when others => arith_out<=x"0000";
--end case;      

--if (op_sel="00") then
--arith_out<=A(7 downto 0)*B(7 downto 0);
--cout<='0';
--elsif op_sel="01" then
--temp<=A + B;
--arith_out<=temp(15 downto 0);
--cout<=temp(16);
--elsif op_sel="10" then
--temp<=A - B;
--arith_out<=temp(15 downto 0);
--cout<=temp(16);
--elsif op_sel="11" then
--temp<=A + 1;
--arith_out<=temp(15 downto 0);
--cout<=temp(16);
--else 
--arith_out<=x"0000";
--cout<='0';
--end if;

--end process;

arith_out<=std_logic_vector(to_unsigned((to_integer(unsigned(A(7 downto 0)))*to_integer(unsigned(B(7 downto 0)))),16))
               when(op_sel="00") else
           A+B when(op_sel="01") else
           A-B when(op_sel="10") else
           A+1 when(op_sel="11");
cout<= '1';        
   

end Behavioral;