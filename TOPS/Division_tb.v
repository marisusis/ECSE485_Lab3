module division_tb;

    reg clk, start;
    reg [3:0] divisor, dividend;
    wire [3:0] Ar, Qr;
    wire done;

    division DIV(
        .clock(clk),
        .start(start),
        .Divisor(divisor),
        .Dividend(dividend),
        .Ar(Ar),
        .Qr(Qr),
        .Done(done)
    );

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end
    
    always @(posedge clk) begin
        if (done == 1)
            start = 0;
    end

    initial begin
        // Load divisor and dividend;
        divisor = 3;
        dividend = 4;
        start = 0;

        #4;

        start = 1;

        #50;

        divisor = 2;
        dividend = 4;
        start = 0;

        #4;

        start = 1;

        #50;

    end

endmodule