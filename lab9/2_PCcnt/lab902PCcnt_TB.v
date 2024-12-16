`timescale 10 ns/100 ps
module lab902PCcnt_TB();

    //input 
    reg pc_en, pc_load, pc_sel;
    reg clk, rstn;
    reg [7:0] PC_OFFSET;
    reg [15:0] PC_BASE;
    
    //output
    wire [15:0] Q;

    //实例化
    lab902PCcnt uut (
        .pc_en(pc_en),
        .pc_load(pc_load),
        .pc_sel(pc_sel),
        .clk(clk),
        .rstn(rstn),
        .PC_OFFSET(PC_OFFSET),
        .PC_BASE(PC_BASE),
        .Q(Q)
    );
    //时钟跳变
    always   #5                                                       
    begin                                                  
            clk <= ~clk;					   
    end  
    initial begin
        clk = 0;
        rstn = 0;
        pc_en = 0;
        pc_load = 0;
        pc_sel = 0;
        PC_OFFSET = 8'b0;
        PC_BASE = 16'b0;
        
        // 释放复位
        #10  rstn = 1;
        #10 
        //Q<=Q+1 {EN,LOAD,SEL}=3'b10x，pc_en = 1, pc_load = 0, pc_sel = 0
        #10  pc_en = 1; pc_load = 0; pc_sel = 0;
        #50;
        //PC=PC_BASE+PC_OFFSET; {EN,LOAD,SEL}=3'b110;绝对地址加偏移量跳转
        #10 pc_load = 1; PC_OFFSET = 8'b0000_0001; PC_BASE = 16'b0000_0000_0000_0010;
        #50
        //相对地址跳转 PC=PC_BASE+PC_OFFSET+PC; {EN,LOAD,SEL}=3'b111; 相对地址跳转
        #10 pc_sel = 1;
        #50 
        
        $stop;
        
    end 
    
    
    
endmodule