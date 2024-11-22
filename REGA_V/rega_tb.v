module Areg_tb;

    reg clock, SI;
    reg [1:0] C;
    reg [3:0] D;
    wire [3:0] Q;

    Areg A(
        .Q(Q),
        .D(D),
        .SI(SI),
        .clock(clock),
        .C(C)
    );

    parameter Load = 2'b00, Reset = 2'b01, Shift = 2'b10, Hold = 2'b11;

    initial begin
        clock = 0;
        forever #1 clock = ~clock;
    end

    initial begin
        C = 2'bZZ;
        #5

        C = Reset;
        D = 4'b1010;
        SI = 1;

        #5
        C = Load;

        #5
        C = Shift;

        #20;


    end

endmodule