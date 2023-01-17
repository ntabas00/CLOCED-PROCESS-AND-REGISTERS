library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity registers_min_max is
port( din : in std_logic_vector(3 downto 0);
 reset : in std_logic;
 clk : in std_logic;
 sel : in std_logic_vector(1 downto 0);
 max_out : out std_logic_vector(3 downto 0);
 min_out : out std_logic_vector(3 downto 0);
 reg_out : out std_logic_vector(3 downto 0));
end registers_min_max ;

architecture  arch_beh of registers_min_max is
signal r0,r1,r2,r3 : std_logic_vector (3 downto 0);


signal max_reg,max_value, min_value, min_reg, max_output, min_output : std_logic_vector (3 downto 0);


begin 
 process (clk,reset)
begin 
 if reset='1'then 
r0 <= "1000";
r1 <= "1000";
r2 <= "1000";
r3 <= "1000";
else  ( clk'event and clk= '1') then 
r0 <= din;
r1 <=r0;
r2 <=r1;
r3 <= r2;

end if;
end process;  

process( r0,r1,r2,r3,sel,clk)
begin
 if (sel = "00") then
reg_out <= r0;
else if  (sel = "01") then 
reg_out <= r1;
else if (sel = "10") then
reg_out <= r2;
else 
reg_out <= r3;



end if;
end if;
end if;
end process;

process(r0,r1,r2,r3)
begin
if (r3>r2 and r3>r1 and r3>r0)  then 
 max_output <= r3;
else if (r2>r3 and r2>r1 and r2>r0) then
 max_output <= r2;
else if (r1>r2 and r1>r3 and r1>r0)then 
 max_output <= r1;
else if(r0>r2 and r0>r1 and r3>r0)then
max_output <=r0; 
else 
max_output<="0000";
end if;
end if; 
end if;
end if;

end process; 

process(r0,r1,r3,r2)
begin
if (r3<r2 and r3<r1 and r3<r0) then 
 min_output <= r3;
else if (r2<r3 and r2<r1 and r2<r0) then
 min_output <= r2;
else if (r1<r2 and r1<r3 and r1<r0)then 
 min_output <= r1;
else if(r0<r2 and r0<r1 and r3<r0)then
min_output <=r0;
else 
min_output<="0000"; 
end if;
end if;
end if;
end if;
end process;

process (clk,reset)
begin
 if (reset='1') then
      max_reg<= "0000";
      min_reg<= "1111";
 else if clk'event and clk='1'then
                if (max_output>max_reg) then 
                 max_value<= max_output;
                 
            end if;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
           if (min_output<min_reg) then 
                  min_value <= min_output;
                  
                 end if;

end if;
end if;


end process;
  max_out <= max_value;
  min_out <= min_value;
  end arch_beh; 
  
  
  
  
  
  
