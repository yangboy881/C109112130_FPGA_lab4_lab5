
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab5_top is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           IN_left_btn  : in  STD_LOGIC;
           IN_right_btn : in  STD_LOGIC;
           Sel_IN_btn   : in  STD_LOGIC;
           Sel_CH_btn   : in  STD_LOGIC;
           Rout : out  STD_LOGIC;
           Gout : out  STD_LOGIC;
           Bout : out  STD_LOGIC;
           H : out  STD_LOGIC;
           V : out  STD_LOGIC);
end Lab5_top;

architecture Behavioral of Lab5_top is
signal ball_to_btn : std_logic_vector(7 downto 0);

------------------------
component Lab4_top
--	generic (
--		<generic_name> : <type> := <value>;
--		<other generics>...
--	);
	port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           btn_ballin : in STD_LOGIC_VECTOR(7 downto 0);
           Rout : out  STD_LOGIC;
           Gout : out  STD_LOGIC;
           Bout : out  STD_LOGIC;
           H : out  STD_LOGIC;
           V : out  STD_LOGIC);
           	
end component;
------------------------
component FSM_pinpon_all
--	generic (
--		<generic_name> : <type> := <value>;
--		<other generics>...
--	);
	port(clk,rst       : in std_logic;
	     IN_left,IN_right,Sel_IN,Sel_CH : in std_logic;
	     Mux2_pinpon_out : out std_logic_vector(7 downto 0));
	
end component;
------------------------
begin

Lab4_VGA : Lab4_top
--generic map ( 
--   <generic_name> => <value>,
--   <other generics>...
--) 
port map (
    clk         => clk,
    rst 		=> not rst,
	btn_ballin  => ball_to_btn,
	Rout 		=> Rout,
	Gout 		=> Gout,
	Bout		=> Bout,
	H           => H,
	V           => V
);
------------------------
FSM_ball : FSM_pinpon_all
--generic map ( 
--   <generic_name> => <value>,
--   <other generics>...
--) 
port map (
   clk 		        => clk,
   rst 		        => not rst,
   IN_left	        => IN_left_btn,
   IN_right         => IN_right_btn,
   Sel_IN           => Sel_IN_btn,
   Sel_CH           => Sel_CH_btn,
   Mux2_pinpon_out  => ball_to_btn
);

end Behavioral;
