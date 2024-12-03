module divider4 (
    clock,
    reset,
    dividend,
    divisor,
    Q,
    A,
    done
);

  input clock;
  input reset;
  input [4-1:0] dividend;
  input [4-1:0] divisor;
  output [4-1:0] Q;
  output [4-1:0] A;
  output done;

  divider #(.N(4)) D (
    clock,
    reset,
    dividend,
    divisor,
    Q,
    A,
    done
  );

endmodule;
