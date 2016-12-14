--------------------------------------
-- SinTable.vhd
-- Written by Gadi and Eran Tuchman.
-- All rights reserved, Copyright 2009
--
--------------------------------------library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SinTableTC is
port(
  CLK     : in std_logic;
  RESET_N : in std_logic;
  ENA     : in std_logic;
  ADDR    : in std_logic_vector(7 downto 0);
  Q       : out std_logic_vector(7 downto 0)
);
end SinTableTC;

architecture arch of SinTableTC is


type table_type is array(0 to 255) of std_logic_vector(7 downto 0);
signal sin_table : table_type;

begin

  SinTableTC_proc: process(RESET_N, CLK)
    constant sin_table : table_type := (X"80",
    X"80",
    X"80",
    X"81",
    X"81",
    X"82",
    X"82",
    X"83",
    X"83",
    X"84",
    X"84",
    X"85",
    X"85",
    X"86",
    X"86",
    X"87",
    X"87",
    X"88",
    X"88",
    X"89",
    X"89",
    X"8A",
    X"8A",
    X"8B",
    X"8C",
    X"8C",
    X"8D",
    X"8D",
    X"8E",
    X"8E",
    X"8F",
    X"90",
    X"90",
    X"91",
    X"91",
    X"92",
    X"92",
    X"93",
    X"94",
    X"94",
    X"95",
    X"95",
    X"96",
    X"97",
    X"97",
    X"98",
    X"98",
    X"99",
    X"9A",
    X"9A",
    X"9B",
    X"9C",
    X"9C",
    X"9D",
    X"9E",
    X"9E",
    X"9F",
    X"A0",
    X"A0",
    X"A1",
    X"A2",
    X"A2",
    X"A3",
    X"A4",
    X"A4",
    X"A5",
    X"A6",
    X"A6",
    X"A7",
    X"A8",
    X"A9",
    X"A9",
    X"AA",
    X"AB",
    X"AC",
    X"AC",
    X"AD",
    X"AE",
    X"AF",
    X"B0",
    X"B0",
    X"B1",
    X"B2",
    X"B3",
    X"B4",
    X"B4",
    X"B5",
    X"B6",
    X"B7",
    X"B8",
    X"B9",
    X"BA",
    X"BB",
    X"BC",
    X"BD",
    X"BE",
    X"BF",
    X"C0",
    X"C1",
    X"C2",
    X"C3",
    X"C4",
    X"C5",
    X"C6",
    X"C7",
    X"C8",
    X"C9",
    X"CA",
    X"CC",
    X"CD",
    X"CE",
    X"D0",
    X"D1",
    X"D2",
    X"D4",
    X"D5",
    X"D7",
    X"D8",
    X"DA",
    X"DC",
    X"DE",
    X"E0",
    X"E2",
    X"E4",
    X"E6",
    X"E9",
    X"EC",
    X"F0",
    X"F4",
    X"00",
    X"0B",
    X"10",
    X"13",
    X"16",
    X"19",
    X"1B",
    X"1D",
    X"20",
    X"21",
    X"23",
    X"25",
    X"27",
    X"28",
    X"2A",
    X"2B",
    X"2D",
    X"2E",
    X"30",
    X"31",
    X"32",
    X"33",
    X"35",
    X"36",
    X"37",
    X"38",
    X"39",
    X"3A",
    X"3B",
    X"3C",
    X"3D",
    X"3E",
    X"40",
    X"40",
    X"41",
    X"42",
    X"43",
    X"44",
    X"45",
    X"46",
    X"47",
    X"48",
    X"49",
    X"4A",
    X"4B",
    X"4B",
    X"4C",
    X"4D",
    X"4E",
    X"4F",
    X"50",
    X"50",
    X"51",
    X"52",
    X"53",
    X"53",
    X"54",
    X"55",
    X"56",
    X"56",
    X"57",
    X"58",
    X"59",
    X"59",
    X"5A",
    X"5B",
    X"5B",
    X"5C",
    X"5D",
    X"5D",
    X"5E",
    X"5F",
    X"60",
    X"60",
    X"61",
    X"61",
    X"62",
    X"63",
    X"63",
    X"64",
    X"65",
    X"65",
    X"66",
    X"67",
    X"67",
    X"68",
    X"68",
    X"69",
    X"6A",
    X"6A",
    X"6B",
    X"6B",
    X"6C",
    X"6D",
    X"6D",
    X"6E",
    X"6E",
    X"6F",
    X"70",
    X"70",
    X"71",
    X"71",
    X"72",
    X"72",
    X"73",
    X"73",
    X"74",
    X"75",
    X"75",
    X"76",
    X"76",
    X"77",
    X"77",
    X"78",
    X"78",
    X"79",
    X"79",
    X"7A",
    X"7A",
    X"7B",
    X"7B",
    X"7C",
    X"7C",
    X"7D",
    X"7D",
    X"7E",
    X"7E",
    X"7F"

);


  begin

    if (RESET_N='0') then
      Q <= sin_table(0);
    elsif(rising_edge(CLK)) then
      if (ENA='1') then
          Q <= sin_table(to_integer(unsigned(ADDR)));
      end if;
    end if;
  end process;
end arch;
