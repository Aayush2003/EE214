library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

library work;
use work.MUX2.all;

entity MUX_4 is
  port (I1, I2, I3, I4, S1, S2: in std_logic; Y: out std_logic);
end entity MUX_4;

architecture Struct of MUX_4 is
  signal y1, y2: std_logic;
begin
  --2x1 MUX
  
  m1: MUX_2 port map (I0 => I1, I1 => I2, S => S1, Y => y1); 
  m2: MUX_2 port map (I0 => I3, I1 => I4, S => S1, Y => y2);
  m3: MUX_2 port map (I0 => y1, I1 => y2, S => S2, Y => Y); 
end Struct;
  