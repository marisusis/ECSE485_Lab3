module Mreg (
    Q,
    D,
    clock,
    C
);
  input [3:0] D;
  input clock, C;
  output [3:0] Q;

  reg [3:0] Q;

  parameter Load = 1'b1, Hold = 1'b0;


  always @(posedge clock) begin
    if (C == Load) Q = D;
    else;
  end
endmodule
