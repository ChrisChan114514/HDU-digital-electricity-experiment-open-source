module lab902PCcnt  //按照实验5 PCcnt原理图进行verilog改写
(
    input pc_en, pc_load, pc_sel,
    input clk, rstn,
    input [7:0] PC_OFFSET,
    input [15:0] PC_BASE,
    output reg [15:0] Q
);

reg signed [15:0] PC_OFFSET_EXT;

always @(*) begin
    // 有符号扩展
    PC_OFFSET_EXT = {{8{PC_OFFSET[7]}}, PC_OFFSET};
end

always @(posedge clk or negedge rstn) begin
    if (!rstn)
        Q <= 0;
    else begin
        case ({pc_en, pc_load, pc_sel})
            3'b100: Q <= Q + 16'd1;
            3'b101: Q<= Q  + 16'd1;
            3'b110: Q <= PC_OFFSET_EXT + PC_BASE;
            3'b111: Q <= Q + PC_OFFSET_EXT + PC_BASE;
            default: Q <= Q;
        endcase
    end
end

endmodule