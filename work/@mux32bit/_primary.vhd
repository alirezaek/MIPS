library verilog;
use verilog.vl_types.all;
entity Mux32bit is
    port(
        in1             : in     vl_logic_vector(31 downto 0);
        in2             : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic;
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end Mux32bit;
