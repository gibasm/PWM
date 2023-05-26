library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pwm is
    generic
    (
        CTRW : natural := 8 
    );  
    port 
    (
        clk : in std_logic;
        ce : in std_logic;
        pwm_out : out std_logic;
        cmp_val : in unsigned(CTRW-1 downto 0)
    );
end entity;

architecture rtl of pwm is
    signal counter : unsigned(CTRW-1 downto 0) := (others => '0');
begin
    
    process(clk, ce, counter, cmp_val)
    begin
        if rising_edge(clk) and ce = '1' then
            counter <= counter + 1; 
        end if;
    end process;
    
    pwm_out <= '1' when (cmp_val >= counter) else '0';

end architecture;
