library ieee;
use ieee.std_logic_1164.all;

package MUX2 is
  component MUX_2 is
    port(I0, I1, S: in std_logic; Y: out std_logic);
  end component MUX_2; 
end package MUX2;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity MUX_2 is
  port(I0, I1, S: in std_logic; Y: out std_logic);
end entity MUX_2;

architecture Struct of MUX_2 is
  signal s1, s2, s3 : std_logic;
begin
  --NOT Gate
  inv1: INVERTER port map (A => S, Y => s1);
  --AND Gates
  a1: AND_2 port map (A => I0, B => s1, Y => s2);
  a2: AND_2 port map (A => S, B => I1, Y => s3);
  --OR Gate
  o1: OR_2 port map (A => s2, B => s3, Y => Y);
end Struct; 