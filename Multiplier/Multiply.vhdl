library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;
library work;
use work.FullAdder.all;

entity Multiply is
  port (A0,A1,A2,A3,B0,B1,B2 : in std_logic; M0,M1,M2,M3,M4,M5,M6 : out std_logic);
end entity Multiply;

architecture Struct of Multiply is
  signal p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,c1,c2,c3,c4,c5,c6,c7,s1,s2,s3 : std_logic;
begin
  -- Partial products
  an1 : AND_2 port map (A => A0, B => B0, Y => p1);
  an2 : AND_2 port map (A => A1, B => B0, Y => p2);
  an3 : AND_2 port map (A => A2, B => B0, Y => p3);
  an4 : AND_2 port map (A => A3, B => B0, Y => p4);
  an5 : AND_2 port map (A => A0, B => B1, Y => p5);
  an6 : AND_2 port map (A => A1, B => B1, Y => p6);
  an7 : AND_2 port map (A => A2, B => B1, Y => p7);
  an8 : AND_2 port map (A => A3, B => B1, Y => p8);
  an9 : AND_2 port map (A => A0, B => B2, Y => p9);
  an10 : AND_2 port map (A => A1, B => B2, Y => p10);
  an11 : AND_2 port map (A => A2, B => B2, Y => p11);
  an12 : AND_2 port map (A => A3, B => B2, Y => p12);
  -- M0
  M0 <= p1;
  -- M1
  ha1 : Half_Adder port map (A => p2, B => p5, S => M1, C => c1);
  -- M2
  fa1 : Full_Adder port map (A => p3, B => p6, Cin => c1, S => s1, Cout => c2);
  ha2 : Half_Adder port map (A => p9, B => s1, S => M2, C => c3);
  -- M3
  fa2 : Full_Adder port map (A => p4, B => c2, Cin => c3, S => s2, Cout => c4);
  fa3 : Full_Adder port map (A => p7, B => p10, Cin => s2, S => M3, Cout => c5);
  -- M4
  fa4 : Full_Adder port map (A => p8, B => c4, Cin => c5, S => s3, Cout => c6);
  ha3 : Half_Adder port map (A => p11, B => s3, S => M4, C => c7);
  -- M5 and M6
  fa5 : Full_Adder port map (A => p12, B => c6, Cin => c7, S => M5, Cout => M6); 
end Struct;