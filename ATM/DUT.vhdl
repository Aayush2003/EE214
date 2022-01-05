-- A DUT entity is used to wrap your design.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(7 downto 0);
       	output_vector: out std_logic_vector(10 downto 0));
end entity;

architecture DutWrap of DUT is
   component atm is
     port (I : in std_logic_vector(7 downto 0); p : out std_logic_vector(1 downto 0); a : out std_logic_vector(1 downto 0); b : out std_logic; c : out std_logic_vector(5 downto 0)); 
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: atm 
			port map (
					-- order of inputs 
					I => input_vector,
               -- order of outputs 
					p => output_vector(10 downto 9),
					a => output_vector(8 downto 7),
					b => output_vector(6),
					c => output_vector(5 downto 0));
end DutWrap;

