module rom_rgb(
    input           clk,
    input           reset_n,
    input  [1:0]    key,
    input [10:0]    x,
    input [10:0]    y,
    output reg [11:0]   rgb
);

localparam ZERO=4'h0,ONE=4'h1,TWO=4'h2,THREE=4'h3,FOUR=4'h4,FIVE=4'h5,SIX=4'h8,SEVEN=4'h9,EIGHT=4'ha,NINE=4'hb,MAOHAO=4'hc;
localparam BLUESKY=4'hf;

reg [5:0]  pal_addr, bg_pal;
reg [11:0] pal_rom[63:0];
reg [5:0]  png_rom[256*64-1:0];

reg [3:0] background;

reg [31:0] time_counter; // 用于计时的计数器
reg [31:0] total_seconds; // 统一的秒数计数器

// 初始化字符 ROM
initial $readmemh("walk_pal.mem", pal_rom);
initial $readmemh("walk.mem", png_rom);

// 时间调整逻辑
always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        time_counter <= 0;
        total_seconds <= 12 * 3600; // 初始化为12:00:00
    end else begin
        time_counter <= time_counter + 1;
        if (time_counter == 25000000) begin // 每秒钟更新一次时间（假设时钟频率为25MHz）
            time_counter <= 0;
            case (key)
            2'b00: total_seconds <= (total_seconds >= 86400)?0:total_seconds + 3600; // 按下是低电平
            2'b01: total_seconds <= (total_seconds >= 86400)?0:total_seconds + 60;
            2'b10: total_seconds <= (total_seconds >= 86400)?0:total_seconds + 2;
            2'b11: total_seconds <= total_seconds + 1;
            default:total_seconds <= total_seconds + 1;
       	    endcase
//            if (total_seconds == 86400) begin // 一天86400秒
//                total_seconds <= 0;
//            end
        end

    end
end

// 通过组合逻辑将秒数分解为小时、分钟和秒
wire [4:0] hours = total_seconds / 3600;
wire [5:0] minutes = (total_seconds % 3600) / 60;
wire [5:0] seconds = total_seconds % 60;

// 背景图像处理
always @(posedge clk) begin
    bg_pal <= png_rom[{background[3], y[4:0], background[2:0], x[4:0]}];
end

// 输出 RGB 值
always @(posedge clk) begin
    rgb <= pal_rom[bg_pal];
end

// 背景图像选择逻辑，显示时间
always @* begin
    case({y[6:5], x[8:5]})
        6'd25, 6'd22: background = MAOHAO; // 显示冒号 ':'

        6'd20: begin // 显示小时的十位
            case (hours / 10)
                4'd0: background = ZERO;
                4'd1: background = ONE;
                4'd2: background = TWO;
                4'd3: background = THREE;
                4'd4: background = FOUR;
                4'd5: background = FIVE;
                4'd6: background = SIX;
                4'd7: background = SEVEN;
                4'd8: background = EIGHT;
                4'd9: background = NINE;
                default: background = BLUESKY;
            endcase
        end

        6'd21: begin // 显示小时的个位
            case (hours % 10)
                4'd0: background = ZERO;
                4'd1: background = ONE;
                4'd2: background = TWO;
                4'd3: background = THREE;
                4'd4: background = FOUR;
                4'd5: background = FIVE;
                4'd6: background = SIX;
                4'd7: background = SEVEN;
                4'd8: background = EIGHT;
                4'd9: background = NINE;
                default: background = BLUESKY;
            endcase
        end

        6'd23: begin // 显示分钟的十位
            case (minutes / 10)
                4'd0: background = ZERO;
                4'd1: background = ONE;
                4'd2: background = TWO;
                4'd3: background = THREE;
                4'd4: background = FOUR;
                4'd5: background = FIVE;
                4'd6: background = SIX;
                4'd7: background = SEVEN;
                4'd8: background = EIGHT;
                4'd9: background = NINE;
                default: background = BLUESKY;
            endcase
        end

        6'd24: begin // 显示分钟的个位
            case (minutes % 10)
                4'd0: background = ZERO;
                4'd1: background = ONE;
                4'd2: background = TWO;
                4'd3: background = THREE;
                4'd4: background = FOUR;
                4'd5: background = FIVE;
                4'd6: background = SIX;
                4'd7: background = SEVEN;
                4'd8: background = EIGHT;
                4'd9: background = NINE;
                default: background = BLUESKY;
            endcase
        end

        6'd26: begin // 显示秒的十位
            case (seconds / 10)
                4'd0: background = ZERO;
                4'd1: background = ONE;
                4'd2: background = TWO;
                4'd3: background = THREE;
                4'd4: background = FOUR;
                4'd5: background = FIVE;
                4'd6: background = SIX;
                4'd7: background = SEVEN;
                4'd8: background = EIGHT;
                4'd9: background = NINE;
                default: background = BLUESKY;
            endcase
        end

        6'd27: begin // 显示秒的个位
            case (seconds % 10)
                4'd0: background = ZERO;
                4'd1: background = ONE;
                4'd2: background = TWO;
                4'd3: background = THREE;
                4'd4: background = FOUR;
                4'd5: background = FIVE;
                4'd6: background = SIX;
                4'd7: background = SEVEN;
                4'd8: background = EIGHT;
                4'd9: background = NINE;
                default: background = BLUESKY;
            endcase
        end

        default: background = BLUESKY; // 默认背景
    endcase
end

endmodule