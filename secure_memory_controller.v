module secure_memory_controller#(
parameter KEY_REG_ADDR = 32'h00000020
)(
    input MemWriteM,
    input [31:0] Address,

    output MemWriteRAM,
    output KeyWriteEnable
);

assign MemWriteRAM = MemWriteM && (Address != KEY_REG_ADDR);

assign KeyWriteEnable = MemWriteM && (Address == KEY_REG_ADDR);

endmodule