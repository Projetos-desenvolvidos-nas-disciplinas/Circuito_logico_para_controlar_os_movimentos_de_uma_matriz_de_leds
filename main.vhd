library ieee;
use ieee.std_logic_1164.all;

entity main is
port(
SW3, SW0, SW2, SW1, KEY, clk: in std_logic;
ledG, ledR: out std_logic_vector(7 downto 0)
);
end main;

architecture ckt of main is

component deslocador is
port(
S0, S1, clr, clk: in std_logic;
Q: out std_logic_vector(7 downto 0)
);
end component;

begin

ESQ_DIR: deslocador port map (SW3, SW0, KEY, clk, ledG);
UP_DW: deslocador port map (SW2, SW1, KEY, clk, ledR);

end ckt;