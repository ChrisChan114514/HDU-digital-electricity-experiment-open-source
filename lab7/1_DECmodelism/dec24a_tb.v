`timescale 10ns/100ps
module dec24a_tb();
    reg [1:0] a;
    wire [3:0] y ;

    lab701DEC24 dec24(
        .IN(a),
        .OUT(y)
    );

    initial begin
        a<=000;
        repeat(8) begin
            #10 a<=a+1;
        end
        $stop;
    end
endmodule