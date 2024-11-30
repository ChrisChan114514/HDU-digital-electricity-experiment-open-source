module lab703ALU
(
    input [15:0] A,
    input [15:0] B,
    input [2:0] ALUOP,
    output reg [15:0] S 
);
    always @(*) 
    begin
        case (ALUOP)
            3'b000: S = A + B; // ADD
            3'b001: S = A - B; // SUB
            3'b010: S = A & B; // AND
            3'b011: S = A | B; // OR
            3'b100: S = A ^ B; // XOR
            3'b101: S = A >>> B[3:0]; // 算术右移
            3'b110: S = A << B[3:0]; // 逻辑左移
            3'b111: S = A >> B[3:0]; // 逻辑右移
        endcase  
    end


endmodule