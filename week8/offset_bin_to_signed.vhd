library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity offset_bin_to_signed is
	port (
			in_num : in std_logic_vector (7 downto 0);
			out_num : out std_logic_vector (7 downto 0)
			);
end entity;
architecture offset_bin_to_signed of offset_bin_to_signed is
signal y : std_logic_vector (7 downto 0);
begin
	y(7)<= not in_num(7);
	y(6 downto 0)<=in_num(6 downto 0);
	out_num<=y;
end architecture;
