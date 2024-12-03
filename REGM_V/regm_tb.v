module Mreg_tb();
    // Declare testbench signals
    reg clock;
    reg [2:0] C;
    reg [3:0] D;
    wire [3:0] Q;

    // Instantiate the register
    Qreg reg1 (
        .Q(Q),
        .D(D),
        .clock(clock),
        .C(C)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #1 clock = ~clock;
    end

    // Test stimulus
    initial begin
        // Initialize signals
        C = 2'b11;  // Hold
        D = 4'b0000;
        
        #4;

        // Test Load
        C = 2'b00;  // Load
        D = 4'b1010;  // Load pattern 1010
        #4;

        // Test Hold
        C = 2'b11;  // Hold
        #4;

        // Test Shift
        C = 2'b10;  // Shift
        @(posedge clock);
        @(posedge clock);
        @(posedge clock);

        // Test Reset
        C = 2'b01;  // Reset
        @(posedge clock);

        // Test Load different pattern
        C = 2'b00;  // Load
        D = 4'b1111;  // Load all ones
        @(posedge clock);

        // Test Hold again
        C = 2'b11;  // Hold
        @(posedge clock);

        C = 2'b00;  // Load
        D = 4'b0000;  // Load all ones
        @(posedge clock);

        C = 3'b100;
        @(posedge clock);
        @(posedge clock);
        @(posedge clock);

        // End simulation
        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time=%0d clock=%b C=%b D=%b Q=%b", 
                 $time, clock, C, D, Q);
    end

    // Optional: Create VCD file for waveform viewing
    initial begin
        $dumpfile("qreg_test.vcd");
        $dumpvars(0, Qreg_tb);
    end

endmodule