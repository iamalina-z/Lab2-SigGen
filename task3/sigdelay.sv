module sigdelay #(
    parameter   A_WIDTH = 9,
                D_WIDTH = 8
)(
    //interface signals
    input       logic                 clk,
    input       logic                 rst,
    input       logic                 en,
    input       logic [D_WIDTH-1:0]   offset,
    input       logic                 wr_en,
    input       logic                 rd_en,
    input       logic  [D_WIDTH-1:0]  din,
    output      logic  [D_WIDTH-1:0]  dout
);

    logic [A_WIDTH-1:0]         address;

counter  addrCounter (
    .clk (clk),
    .rst (rst),
    .en  (en),
    .count (address)
);

duoram #(9,8) ram2port (
    .clk     (clk),
    .wr_en   (wr_en),
    .rd_en   (rd_en),
    .din     (din),
    .wr_addr (address+offset),
    .rd_addr (address),
    .dout    (dout)
);

endmodule
