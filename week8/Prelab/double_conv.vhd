library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity double_conv is
  port (    DATA        : in   std_logic_vector ( 7 downto 0);
            DEBUG		:	out	std_logic_vector (7 downto 0);
            OUTD        :   out std_logic_vector(7 downto 0)
            );

  
end entity;

architecture double_conv of double_conv is
    component offset_bin_to_signed is
    port (    in_num        : in   std_logic_vector ( 7 downto 0);
                out_num     :   out std_logic_vector(7 downto 0)
              );
    end component;    
    signal from_one_to_two : std_logic_vector(7 downto 0);

begin

    comv1: offset_bin_to_signed port map (
                    in_num => DATA,
                    out_num => from_one_to_two
    );

    con2 : offset_bin_to_signed port map (
                    in_num => from_one_to_two,
                    out_num => OUTD
    );
DEBUG <= from_one_to_two;

end architecture;