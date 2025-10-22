module lab203
(
    input A,B,Cin,
    output reg SO,Cout

);
    always@(*)
    begin
        case ({A,B,Cin})
            3'b000: {Cout,SO}=2'b00;
            3'b001: {Cout,SO}=2'b01;
            3'b010: {Cout,SO}=2'b01;
            3'b011: {Cout,SO}=2'b10;
            3'b100: {Cout,SO}=2'b01;
            3'b101: {Cout,SO}=2'b10;
            3'b110: {Cout,SO}=2'b10;
            3'b111: {Cout,SO}=2'b11;
            default: {Cout,SO}=2'b00;
        endcase
    end






endmodule 