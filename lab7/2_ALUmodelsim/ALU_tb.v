`timescale 10ns/100ps
module ALU_tb();
reg [2:0] ALUOP ;
reg [15:0] A, B;
wire [15:0] S;
lab703ALU alu (
    .A(A),
    .B(B),
    .ALUOP(ALUOP),
    .S(S)
);

initial begin
    ALUOP = 3'b000;
    repeat(8)
    begin
        A = ($random)%16'HFFFF;
        B = ($random)%16'HFFFF;
        #10 ALUOP = ALUOP + 1;
    end
$stop;
end


endmodule
