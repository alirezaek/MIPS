library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        Regdst          : out    vl_logic;
        ALUSrc          : out    vl_logic;
        MemtoReg        : out    vl_logic;
        RegWrite        : out    vl_logic;
        MemRead         : out    vl_logic;
        MemWrite        : out    vl_logic;
        Branch          : out    vl_logic;
        ALUop           : out    vl_logic_vector(3 downto 0);
        Jump            : out    vl_logic;
        opcode          : in     vl_logic_vector(5 downto 0);
        funct           : in     vl_logic_vector(5 downto 0)
    );
end Controller;
