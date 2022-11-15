----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2021 12:44:24 PM
-- Design Name: 
-- Module Name: ALUcontroller - Behavioral
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

entity controller is
    Port ( mode : in STD_LOGIC;
           copcode : in STD_LOGIC_VECTOR (2 downto 0);
           sel : out STD_LOGIC_VECTOR (1 downto 0);
           sel1 : out STD_LOGIC;
           sel2 : out STD_LOGIC;
           selout : out STD_LOGIC;
           direction : out STD_LOGIC;
           stype : out STD_LOGIC;
           copcodeout : out STD_LOGIC_VECTOR (2 downto 0));
end controller;

architecture Behavioral of controller is

begin
process(copcode,mode)
begin
--    sel<= "00";
--    sel1 <= '0';
--    sel2 <= '0';
--    selout <= '0';
--    direction <= '0';
--    stype <= '0';
--    copcodeout <= "000";

    if mode = '0' then -- If Mode is 0, then use Logic Unit
       sel1 <= '0';
       sel2 <= '0';
       selout <= '0';
       copcodeout <= copcode;
    elsif mode = '1' then -- If Mode is 1, then Arithmetic and Shifter Units are used
       case copcode is
            when "000" => -- A * B
                sel1 <= '0'; sel2 <= '1'; selout <= '1';sel <= "00";
            when "001" => -- A + B
                sel1 <= '0'; sel2 <= '1'; selout <= '1'; sel <= "01";
            when "010" => -- A - B
                sel1 <= '0'; sel2 <= '1'; selout <= '1'; sel <= "10"; 
            when "011" => -- Increment A (A + 1), Carry out is enabled
                sel1 <= '0'; sel2 <= '1'; selout <= '1'; sel <= "11";
            when "100" => -- Shift left
                sel1 <= '1'; sel2 <= '1'; selout <= '0'; stype <= '0';direction <= '0';
            when "101" => -- Shift right
                sel1 <= '1'; sel2 <= '1'; selout <= '0'; stype <= '0'; direction <= '1';
            when "110" => -- Rotate left
                sel1 <= '1';sel2 <= '1'; selout <= '0'; stype <= '1'; direction <= '0';
            when "111" => -- Rotate right
                sel1 <= '1'; sel2 <= '1'; selout <= '0'; stype <= '1'; direction <= '1';
            when others =>
                    null;
        end case;
    end if;
end process;
end Behavioral;