library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pwm_tb is
end entity;

architecture tb of pwm_tb is
    signal clk : std_logic := '0';
    signal pwm_out : std_logic;
    signal cmp_val : unsigned(7 downto 0) := x"3F";
    
    constant CLK_PERIOD : time := 30 ns;

begin

    pwm0: entity work.pwm port map(
        clk, '1', pwm_out, cmp_val
    );

    clk <= not clk after CLK_PERIOD / 2;

    process
    begin
        wait for 3 * CLK_PERIOD * 255;
        cmp_val <= x"0F";
        wait for 3 * CLK_PERIOD * 255;
        cmp_val <= x"FF";
        wait for 3 * CLK_PERIOD * 255;
        wait;
    end process;

end architecture;
