--+--------------------------------------------------------------------------------------------------------------------+
--|  File: counter.vhd
--|  Project: counter
--|  Description: Example of counter with asynchronous reset and synchronous enable.
--|
--+--------------------------------------------------------------------------------------------------------------------+
--+-----------------------------------------------------------------------------+
--|									LIBRARIES									|
--+-----------------------------------------------------------------------------+
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

--+-----------------------------------------------------------------------------+
--|								ENTITY & ARCHITECTURE							|
--+-----------------------------------------------------------------------------+
entity counter is
	generic(size : integer := 8);
port (
	clk_i  : in std_logic;
	arst_i : in std_logic;
    en_i   : in std_logic;
   	q_o    : out std_logic_vector(size-1 downto 0)
);
end counter;

architecture rtl of counter is
    --+-----------------------------------------------------------------------------+
    --|									SIGNALS   									|
    --+-----------------------------------------------------------------------------+
begin
	CNT_P: process(clk_i, arst_i, en_i)
        variable iq : std_logic_vector(size-1 downto 0) := (others => '0');
	begin
	    if (arst_i = '1') then
    		iq := (others => '0');
        elsif (rising_edge(clk_i)) then
            if (en_i = '1') then
                iq := iq + 1;
            end if;
    	end if;
        q_o <= iq;
    end process CNT_P;
end rtl;
