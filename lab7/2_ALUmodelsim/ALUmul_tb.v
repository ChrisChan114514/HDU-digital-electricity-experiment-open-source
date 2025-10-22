`timescale 10ns/100ps
module ALUmul_tb();
reg [2:0] ALUOP ;
reg [15:0] A, B;
wire [31:0] S; // 修改输出为32位
lab703ALU alu2 (
    .A(A),
    .B(B),
    .ALUOP(ALUOP),
    .S(S)
);

initial begin
    ALUOP = 3'b111; // 设置为无符号乘法操作
    repeat(8)
    begin
        A = $random & 16'hFFFF;
        B = $random & 16'hFFFF;
        #10;
    end
    $stop;
end

endmodule