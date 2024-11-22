module addsub (
    r,
    a,
    b,
    control
);
  wire co;
  output [3:0] r;
  input [3:0] a, b;
  input control;

  assign r = (control == 0 ? a + b : a - b);
endmodule
