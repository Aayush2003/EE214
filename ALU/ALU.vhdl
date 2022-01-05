
library ieee;
use ieee.std_logic_1164.all;

entity alu_beh is
    generic(
        operand_width : integer:=4;
        sel_line : integer:=2
        );
    port (
        A: in std_logic_vector(operand_width-1 downto 0);
        B: in std_logic_vector(operand_width-1 downto 0);
        sel: in std_logic_vector(sel_line-1 downto 0);
        op: out std_logic_vector((operand_width*2)-1 downto 0)
    ) ;
end alu_beh;

architecture a1 of alu_beh is
    function add(A: in std_logic_vector(operand_width-1 downto 0); B: in std_logic_vector(operand_width-1 downto 0))
        return std_logic_vector is
            variable sum : std_logic_vector(operand_width downto 0) := (others => '0');
				variable carry : std_logic := '0';
				variable temp : std_logic;
				variable index : integer;
        begin
            addition : for index in 0 to operand_width-1 loop
				    temp := A(index) xor B(index);
				    sum(index) := temp xor carry;
					 carry := (A(index) and B(index)) or (carry and temp);
				end loop addition;
			   sum(operand_width) := carry;	
            return sum;
    end add;
 
begin
alu : process( A, B, sel )
	 variable out1,out2,out3 : std_logic_vector(2*operand_width-1 downto 0) := (others => '0');
	 variable index : integer;
begin
   -- complete VHDL code for various outputs of ALU based on select lines
	
   if sel = "00" then 
       op <= A&B;
	elsif sel = "01" then
       out1(operand_width downto 0) := add(A,B);
		 op <= out1;
	elsif sel = "10" then
       for index in 0 to operand_width-1 loop
		     out2(index) := A(index) xor B(index);
		 end loop;
		 op <= out2;
	else 
	    out3(operand_width downto 1) := A;
		 op <= out3;
   end if;

end process ; -- alu
end a1 ; -- a1
