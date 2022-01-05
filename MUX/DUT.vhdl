-- A DUT entity is used to wrap your design.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(5 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
   component MUX_4 is
     port(I1, I2, I3, I4, S1, S2: in std_logic; Y: out std_logic);
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: MUX_4 
			port map (
					-- order of inputs
					I4 => input_vector(5),
					I3 => input_vector(4),
					I2 => input_vector(3),
					I1 => input_vector(2),
					S2 => input_vector(1),
					S1 => input_vector(0),
               --order of outputs 
					Y  => output_vector(0));

end DutWrap;

