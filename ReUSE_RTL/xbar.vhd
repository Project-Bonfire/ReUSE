--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

entity XBAR is
    generic (
        DATA_WIDTH: integer := 8
    );
    port (
        North_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        East_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        West_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        South_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        Local_in: in std_logic_vector(DATA_WIDTH-1 downto 0);

        North_in_prev: in std_logic_vector(DATA_WIDTH-1 downto 0);
        East_in_prev : in std_logic_vector(DATA_WIDTH-1 downto 0);
        West_in_prev : in std_logic_vector(DATA_WIDTH-1 downto 0);
        South_in_prev: in std_logic_vector(DATA_WIDTH-1 downto 0);
        Local_in_prev: in std_logic_vector(DATA_WIDTH-1 downto 0);

        fault_in: in std_logic;
        sel: in std_logic_vector (4 downto 0);
        Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end;

architecture behavior of XBAR is
begin
process(sel, North_in, East_in, West_in, South_in, Local_in, North_in_prev,
       fault_in, East_in_prev , West_in_prev , South_in_prev, Local_in_prev) begin
    case(sel) is

    	when "00001" =>
        if fault_in = '0' then
    		  Data_out <= Local_in;
        else
          Data_out <= Local_in_prev;
        end if;
    	when "00010" =>
        if fault_in = '0' then
          Data_out <= South_in;
        else
          Data_out <= South_in_prev;
        end if;
    	when "00100" =>
        if fault_in = '0' then
    		Data_out <= West_in;
        else
          Data_out <= West_in_prev;
        end if;
    	when "01000" =>
          if fault_in = '0' then
          Data_out <= East_in;
        else
          Data_out <= East_in_prev;
        end if;
    	when others =>
        if fault_in = '0' then
        Data_out <= North_in;
        else
          Data_out <= North_in_prev;
        end if;
    end case;
   end process;
end;
