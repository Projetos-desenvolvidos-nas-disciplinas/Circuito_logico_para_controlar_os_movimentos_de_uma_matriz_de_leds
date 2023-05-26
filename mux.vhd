library ieee;
use ieee.std_logic_1164.all;

entity mux is
port(
D0, D1, D2, D3, S0, S1: in std_logic;
Q: out std_logic
);
end mux;

architecture ckt of mux is
begin
Q <= (not S0 AND not S1 AND D0) OR (not S0 AND S1 AND D1) OR (S0 AND not S1 AND D2) OR (S0 AND S1 AND D3);
end ckt;