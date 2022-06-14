library verilog;
use verilog.vl_types.all;
entity Data_Memory is
    port(
        clk             : in     vl_logic;
        addr            : in     vl_logic_vector(31 downto 0);
        rd_en           : in     vl_logic;
        \out\           : out    vl_logic_vector(31 downto 0);
        wr_en           : in     vl_logic;
        wr_data         : in     vl_logic_vector(31 downto 0)
    );
end Data_Memory;
