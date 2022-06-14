library verilog;
use verilog.vl_types.all;
entity Register_File is
    port(
        clk             : in     vl_logic;
        rd1_addr        : in     vl_logic_vector(4 downto 0);
        rd1_data        : out    vl_logic_vector(31 downto 0);
        rd2_addr        : in     vl_logic_vector(4 downto 0);
        rd2_data        : out    vl_logic_vector(31 downto 0);
        wr_en           : in     vl_logic;
        wr_addr         : in     vl_logic_vector(4 downto 0);
        wr_data         : in     vl_logic_vector(31 downto 0)
    );
end Register_File;
