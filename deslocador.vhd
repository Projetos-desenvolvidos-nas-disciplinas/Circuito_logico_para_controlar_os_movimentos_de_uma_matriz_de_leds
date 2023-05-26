library ieee;
use ieee.std_logic_1164.all;

entity deslocador is
port(
S0, S1, clr, clk: in std_logic;
Q: out std_logic_vector(7 downto 0)
);
end deslocador;

architecture ckt of deslocador is

signal SQ, I: std_logic_vector(7 downto 0);

component reg_1bit is
port(
I, load, clr, set, clk: in std_logic;
q: out std_logic
);
end component;

component mux is
port(
D0, D1, D2, D3, S0, S1: in std_logic;
Q: out std_logic
);
end component;

begin

M0: mux port map (SQ(0), SQ(7), SQ(1), SQ(0), S0, S1, I(0));
F0: reg_1bit port map (I(0), '1', '0', clr, clk, SQ(0));

M1: mux port map (SQ(1), SQ(0), SQ(2), SQ(1), S0, S1, I(1));
F1: reg_1bit port map (I(1), '1', clr, '0', clk, SQ(1));

M2: mux port map (SQ(2), SQ(1), SQ(3), SQ(2), S0, S1, I(2));
F2: reg_1bit port map (I(2), '1', clr, '0', clk, SQ(2));

M3: mux port map (SQ(3), SQ(2), SQ(4), SQ(3), S0, S1, I(3));
F3: reg_1bit port map (I(3), '1',  clr, '0', clk, SQ(3));

M4: mux port map (SQ(4), SQ(3), SQ(5), SQ(4), S0, S1, I(4));
F4: reg_1bit port map (I(4), '1',  clr, '0', clk, SQ(4));

M5: mux port map (SQ(5), SQ(4), SQ(6), SQ(5), S0, S1, I(5));
F5: reg_1bit port map (I(5), '1',  clr, '0', clk, SQ(5));

M6: mux port map (SQ(6), SQ(5), SQ(7), SQ(6), S0, S1, I(6));
F6: reg_1bit port map (I(6), '1',  clr, '0', clk, SQ(6));

M7: mux port map (SQ(7), SQ(6), SQ(0), SQ(7), S0, S1, I(7));
F7: reg_1bit port map (I(7), '1', clr, '0', clk, SQ(7));

Q <= SQ;

end ckt;
