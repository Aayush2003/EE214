library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;
library work;
use work.FullAdder.all;

entity Four_Bit_AddSub is 
  port(A0, A1, A2, A3, B0, B1, B2, B3, M: in std_logic; S0, S1, S2, S3, Cout: out std_logic);
end entity Four_Bit_AddSub;

architecture Struct of Four_Bit_AddSub is
  signal c0, c1, c2, xb0, xb1, xb2, xb3: std_logic;
begin
  --XOR Gates
  x0: XOR_2 port map (A => M, B => B0, Y => xb0); 
  x1: XOR_2 port map (A => M, B => B1, Y => xb1);
  x2: XOR_2 port map (A => M, B => B2, Y => xb2);
  x3: XOR_2 port map (A => M, B => B3, Y => xb3);
  --Full Adders
  fa1: FULL_ADDER port map (A => A0, B => xb0, Cin => M, S => S0, Cout => c0);  
  fa2: FULL_ADDER port map (A => A1, B => xb1, Cin => c0, S => S1, Cout => c1); 
  fa3: FULL_ADDER port map (A => A2, B => xb2, Cin => c1, S => S2, Cout => c2); 
  fa4: FULL_ADDER port map (A => A3, B => xb3, Cin => c2, S => S3, Cout => Cout); 
end Struct;