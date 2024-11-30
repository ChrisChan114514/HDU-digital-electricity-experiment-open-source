module lab703ALUmul
(
    input [15:0] A,
    input [15:0] B,
    input [2:0] ALUOP,
    output [15:0] S 
);
    
    
    //reg [15:0] S ;
    assign S = (ALUOP == 3'b000) ? A + B : // ADD
               (ALUOP == 3'b001) ? A - B : // SUB
               (ALUOP == 3'b010) ? A & B : // AND
               (ALUOP == 3'b011) ? A | B : // OR
               (ALUOP == 3'b100) ? A ^ B : // XOR
               (ALUOP == 3'b101) ? A >>> B[3:0] : // 算术右移
               (ALUOP == 3'b110) ? A << B[3:0] : // 逻辑左移
               (ALUOP == 3'b111) ? A >> B[3:0] : // 逻辑右移
               32'd0; // 默认值


endmodule

/*module lab703ALUmul_32
(
    input [31:0] A,
    input [31:0] B,
    input [2:0] ALUOP,
    output [31:0] S 
);
    
    // reg [31:0] S ;
    assign S = (ALUOP == 3'b000) ? A + B : // ADD
               (ALUOP == 3'b001) ? A - B : // SUB
               (ALUOP == 3'b010) ? A & B : // AND
               (ALUOP == 3'b011) ? A | B : // OR
               (ALUOP == 3'b100) ? A ^ B : // XOR
               (ALUOP == 3'b101) ? A >>> B[3:0] : // 算术右移
               (ALUOP == 3'b110) ? A << B[3:0] : // 逻辑左移
               (ALUOP == 3'b111) ? A >> B[3:0] : // 逻辑右移
               32'd0; // 默认值



//endmodule*/