module divider_tv;

  reg clock, reset;

  parameter N = 16;
  reg [N-1:0] dividend, divisor;
  wire [N-1:0] Q, A;
  wire done;

  divider #(.N(N)) D (
    clock,
    reset,
    dividend,
    divisor,
    Q,
    A,
    done
  );

  initial begin
    clock = 0;
    forever #1 clock = ~clock;
  end

  initial begin
    dividend = 23;
    divisor  = 5;
    reset = 1;
    #4;
    reset = 0;




    #100;

    dividend = 12345;
    divisor  = 678;
    reset = 1;
    #4;
    reset = 0;

    


    #100;

  end

endmodule
;
