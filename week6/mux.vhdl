library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity mux is
  port (ind     :   in      std_logic_vector(3 downto 0);
        sel     :   in      std_logic_vector(1 downto 0);
        outd    :   out     std_logic
  );
end entity;

architecture mux of mux is
begin
    process(ind,sel)
        begin
            case( sel ) is
                when "00" =>
                    outd <= ind(0);
                when "01" =>
                    outd <= ind(1);
                when "00" =>
                    outd <= ind(2);
                when others =>
                    outd <= ind(3);
        end case;
    end process;
end architecture;
