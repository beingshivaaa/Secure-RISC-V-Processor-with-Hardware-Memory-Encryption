module secure_key_storage(
    input clk,
    input reset,

    input key_write_enable,
    input [31:0] key_in,

    output reg [31:0] secret_key,
    output reg key_locked,
    output reg key_valid
);

always @(posedge clk) begin

    if(reset) begin
        secret_key <= 32'b0;   // Default key
        key_locked <= 1'b0;
        key_valid  <= 1'b0;
    end

    else if(key_write_enable && !key_locked) begin
        secret_key <= key_in;
        key_locked <= 1'b1;
        key_valid  <= 1'b1;
    end

end

endmodule