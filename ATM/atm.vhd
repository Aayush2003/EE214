--///////////////////////////////////////////////////////////////////////////

-- @ Soumyajit Langal (WEL IITB)
-- The skeleton code for Mid-Semester EE214. 

--///////////////////////////////////////////////////////////////////////////

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity atm is
  port (I : in std_logic_vector(7 downto 0); p : out std_logic_vector(1 downto 0); a : out std_logic_vector(1 downto 0); b : out std_logic; c : out std_logic_vector(5 downto 0)); 
end entity atm;

architecture struct of atm is

component div is
generic(
			N : integer:=8; -- operand width
			NN : integer:=16 -- result width
        );
port (
			Nu: in std_logic_vector(N-1 downto 0);-- Nu (read numerator) is dividend
			D: in std_logic_vector(N-1 downto 0);-- D (read Denominator) is divisor
			RQ: out std_logic_vector(NN-1 downto 0)--upper N bits of RQ will have remainder and lower N bits will have quotient
) ;
end component;

signal q1,q2,r1,r2 : std_logic_vector(7 downto 0);
signal out1,out2 : std_logic_vector(15 downto 0);
signal x1,y1,z1,s1,s2,s3,s4,s5,s6 : std_logic;

begin

-- First division
division1: div port map (Nu => I, D => "01100100", RQ => out1);
r1 <= out1(15 downto 8);
q1 <= out1(7 downto 0);

--Second division
division2: div port map (Nu => r1, D => "00110010", RQ => out2);
r2 <= out2(15 downto 8);
q2 <= out2(7 downto 0);

--Obtaining x1,y1,z1
y1 <= q2(0);
o1 : OR_2 port map (A => r2(5), B => r2(4), Y => s1);
o2 : OR_2 port map (A => r2(3), B => r2(2), Y => s2);
o3 : OR_2 port map (A => r2(1), B => r2(0), Y => s3);
o4 : OR_2 port map (A => s1, B => s2, Y => s4);
o5 : OR_2 port map (A => s3, B => s4, Y => z1);
o6 : OR_2 port map (A => q1(0), B => q1(1), Y => x1);

--Applying Boolean expressions for output
o7 : OR_2 port map (A => x1, B => y1, Y => p(1));
n1 : INVERTER port map (A => y1, Y => s5);
a1 : AND_2 port map (A => s5, B => z1, Y => s6);
o8 : OR_2 port map (A => x1, B => s6, Y => p(0));

a <= q1(1 downto 0);
b <= q2(0);
c <= r2(5 downto 0);

end struct;
