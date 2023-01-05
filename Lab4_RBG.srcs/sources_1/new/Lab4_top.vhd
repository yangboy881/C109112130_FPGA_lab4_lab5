
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab4_top is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Rout : out  STD_LOGIC;
           Gout : out  STD_LOGIC;
           Bout : out  STD_LOGIC;
           H : out  STD_LOGIC;
           V : out  STD_LOGIC);
end Lab4_top;

architecture Behavioral of Lab4_top is
signal div_out : std_logic;

component vgatest
--	generic (
--		<generic_name> : <type> := <value>;
--		<other generics>...
--	);
	port(clock         : in std_logic;
		  R, G, B, H, V : out std_logic);
	
end component;
------------------------
component div
--	generic (
--		<generic_name> : <type> := <value>;
--		<other generics>...
--	);
	port(clk,rst       : in std_logic;
		  divclk_1		 : out std_logic);
	
end component;
------------------------
begin

VGA_GO : vgatest
--generic map ( 
--   <generic_name> => <value>,
--   <other generics>...
--) 
port map (
   clock => div_out,
   R 		=> Rout,
	G 		=> Gout,
	B 		=> Bout,
	H 		=> H,
	V 		=> V
);
------------------------
div_GO : div
--generic map ( 
--   <generic_name> => <value>,
--   <other generics>...
--) 
port map (
   clk 		=> clk,
   rst 		=> not rst,
	divclk_1	=> div_out
);

end Behavioral;

