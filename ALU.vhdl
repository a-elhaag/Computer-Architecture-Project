library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU4bit is
    port (
        A, B        : in  unsigned(3 downto 0);    -- 4-bit inputs
        Cin        : in  std_logic;
        Slc        : in  std_logic_vector(3 downto 0); -- Select lines
        Cout       : out std_logic;                -- Carry/Borrow out
        Zero       : out std_logic;                -- Zero flag
        GreaterThan: out std_logic;                -- Greater than flag
        LessThan   : out std_logic;                -- Less than flag
        F          : out unsigned(3 downto 0)     -- Result
    );
end ALU4bit;

architecture Behavioral of ALU4bit is
begin
    process (A, B, Cin, Slc)
        variable temp_result : unsigned(3 downto 0);
    begin
        -- Initialize flags to false
        Zero       <= '0';
        GreaterThan <= '0';
        LessThan   <= '0';

        case Slc is
            when "0000" => temp_result := A + B + ("" & Cin);            -- Addition
            when "0001" => temp_result := A - B - ("" & not Cin);        -- Subtraction
            when "0010" => temp_result := resize(A * B, 4);              -- Multiplication
            when "0011" => 
                if B /= 0 then
                    temp_result := resize(A / B, 4);                    -- Division
                else
                    temp_result := (others => '1');                    -- Division by zero error
                end if;

            when "0100" => temp_result := A and B;                      -- Logical AND
            when "0101" => temp_result := A or B;                       -- Logical OR
            when "0110" => temp_result := A xor B;                      -- Logical XOR
            when "0111" => temp_result := not A;                        -- Logical NOT A

            when "1000" => temp_result := A nand B;                     -- Bitwise NAND
            when "1001" => temp_result := A nor B;                      -- Bitwise NOR
            when "1010" => temp_result := A xnor B;                     -- Bitwise XNOR

            when "1011" => temp_result := A + 1;                        -- Increment A
            when "1100" => temp_result := A - 1;                        -- Decrement A

            when "1101" =>                                             -- Equality (A = B)
                if A = B then
                    temp_result := (others => '0');                    
                    Zero <= '1';                                        
                else
                    temp_result := (others => '1');                   
                end if;

            when "1110" =>                                             -- Less than (A < B)
                if A < B then
                    temp_result := (others => '0');
                    LessThan   <= '1';
                else
                    temp_result := (others => '0');
                end if;

            when "1111" =>                                             -- Greater than (A > B)
                if A > B then
                    temp_result := (others => '0');
                    GreaterThan <= '1';
                else
                    temp_result := (others => '0');
                end if;

            when others =>                                            -- Default (Invalid opcode)
                temp_result := (others => '0');
        end case;

        -- Set Zero flag if result is zero
        if temp_result = 0 then
            Zero <= '1';
        end if;

        -- Output results
        F    <= temp_result;
        Cout <= temp_result(3);  
    end process;
end Behavioral;
