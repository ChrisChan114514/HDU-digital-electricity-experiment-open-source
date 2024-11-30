/*`timescale 10ns / 100ps

module ALUmul_tb;

    // Internal variables for multiplication
    reg [31:0] result;           // Full 32-bit result
    reg [15:0] multiplicand;     // Multiplicand
    reg [15:0] multiplier;       // Multiplier
    integer i;

    initial begin
        // Initialize inputs
        //直接实现功能
        result = 32'd0;
        multiplicand = 16'd6;    // Example: A = 6
        multiplier = 16'd7;      // Example: B = 7
        for (i=0;i<16;i=i+1) begin
            if (multiplier[0] == 1) begin
                result = result + {16'd0, multiplicand};
            end
            multiplicand = multiplicand << 1;
            multiplier = multiplier >> 1;
            #10; 
        end
        $stop;
    end
endmodule*/
`timescale 10ns / 100ps


module ALUmul_tb;

    // Inputs
    reg [15:0] A, B;
    reg [2:0] ALUOP;

    // Outputs
    wire [15:0] S;

    // Instantiate the ALU module
    lab703ALUmul uut (
        .A(A),
        .B(B),
        .ALUOP(ALUOP),
        .S(S)
    );

    // Internal variables
    reg [15:0] multiplicand;      // 被乘数，16位
    reg [15:0] multiplier;        // 乘数，16位
    reg [31:0] result;            // 结果，32位
    integer i;

    initial begin
        // 初始化输入
        multiplicand = 16'd6;    // 示例：被乘数 A = 6
        multiplier = 16'd7;      // 示例：乘数 B = 7
        result = 32'd0;          // 初始结果为0

        // 移位相加法
        for (i = 0; i < 16; i = i + 1) begin
            if (multiplier[0] == 1) begin
                // 累加被乘数到结果
                A = result[15:0];       // 当前结果的低16位
                B = multiplicand;       // 被乘数（16位）
                ALUOP = 3'b000;         // 使用加法操作
                #10;
                result[15:0] = S;       // 更新结果低16位

                A = result[31:16];      // 当前结果的高16位
                B = 16'd0;              // 加法时高位加0
                ALUOP = 3'b000;         // 使用加法操作
                #10;
                result[31:16] = S;      // 更新结果高16位
            end

            // 被乘数左移一位
            A = multiplicand;
            B = 16'd1;
            ALUOP = 3'b110;             // 左移操作
            #10;
            multiplicand = S;

            // 乘数右移一位
            A = multiplier;
            B = 16'd1;
            ALUOP = 3'b111;             // 右移操作
            #10;
            multiplier = S;
        end

        // 打印结果
        
        #10;
        $stop;
    end

endmodule
