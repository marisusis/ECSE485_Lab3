module addsub_tb;

    wire [3:0] r;
    reg [3:0] a, b;
    reg control, clock;

    addsub MATH(
        r,
        a,
        b,
        control
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #1 clock = ~clock;
    end

    // Test stimulus
    initial begin
        // Add 2 and 4
        a = 4;
        b = 2;
        control = 0;
        #4;

        control = 1;
        #4;

        a = 3;
        b = 5;
        control = 0;
        #4;


        control = 1;
        #4;



    end

endmodule;