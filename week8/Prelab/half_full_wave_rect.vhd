library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity half_full_wave_rect is
  port (    DATA        :   in  std_logic_vector(7 downto 0);
            CLK         :   in  std_logic                   ;
            RESETN      :   in  std_logic                   ;
            MODE        :   in  std_logic_vector(3 downto 0);
            OUTPUTD     :   out std_logic_vector(7 downto 0)
  );
end entity;

architecture half_full_wave_rect of half_full_wave_rect is

    type state_type is (bypass,invert,full_wave,half_wave, quanti2 ,quanti4
                    , half, double, hister_inver, reset);

    signal state    : state_type;
    signal intdata  : integer range (-128) to 127;

begin

	intdata <= (conv_integer(DATA));


    process (CLK, RESETN)
    begin
        if (RESETN ='0') then
            state <= reset;
        elsif (rising_edge(CLK)) then
            case( MODE ) is

                when "0000" =>
					state <= bypass;

                when "0001" =>
					state <= invert;

                when "0010" =>
					state <= full_wave;

                when "0011" =>
					state <= half_wave;

                when "0100" =>
					state <= half;

                when "0101" =>
					state <= double;

                when "0110" =>
					state <= quanti2;

                when  "0111" =>
					state <= quanti4;

                when "1000" =>
					state <= hister_inver;

                when others =>
					state <= state;

            end case;


        end if;
    end process;



states_of_machine:    process(state)
    variable flag : boolean := false;
    begin

        case( state ) is
			when reset =>
				OUTPUTD <= "00000000";


            when bypass =>
                OUTPUTD <= DATA;


            when invert =>
                OUTPUTD <= conv_std_logic_vector((-1)* intdata , 8);


            when full_wave =>
                OUTPUTD <= conv_std_logic_vector(abs(intdata) , 8);


            when half_wave =>
                if (intdata < 0) then
                    OUTPUTD <= "00000000";
                else
                    OUTPUTD <= DATA;
                end if;


            when quanti2 =>
                OUTPUTD(7 downto 2) <= DATA ( 7 downto 2);
                OUTPUTD(1 downto 0) <= "00";


            when quanti4 =>
                OUTPUTD(7 downto 4) <= DATA(7 downto 4);
                OUTPUTD(3 downto 0) <= "0000";


            when half =>
                OUTPUTD <= conv_std_logic_vector( intdata / 2 , 8);


            when double =>
                if ((-128)<(intdata*2) and (intdata*2)>127 ) then
                    OUTPUTD <= conv_std_logic_vector( intdata*2 , 8);
                elsif (intdata >0) then
                    OUTPUTD <= conv_std_logic_vector( 127 , 8);
                else
                    OUTPUTD <= conv_std_logic_vector( -128 , 8);
                end if;


            when hister_inver =>
                if (flag = true) then
                    if (intdata <64) then
                        OUTPUTD <= conv_std_logic_vector(127 , 8);
                        flag := true;
                    else
                        OUTPUTD <= conv_std_logic_vector(-127 , 8);
                        flag := false ;
                    end if;
                elsif (flag = false) then
                    if (intdata >-64) then
                        OUTPUTD <= conv_std_logic_vector(-127 , 8);
                        flag := false;
                    else
                        OUTPUTD <= conv_std_logic_vector(127 , 8);
                        flag := true;
                    end if;
                end if;

        end case;
    end process;




end architecture;
