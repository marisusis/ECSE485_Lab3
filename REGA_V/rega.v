module Areg (
    Q,
    D,
    SI,
    clock,
    C
);
  input [3:0] D;
  input clock, SI;
  input [1:0] C;
  output [3:0] Q;

  reg [3:0] Q;

  parameter Load = 2'b00, Reset = 2'b01, Shift = 2'b10, Hold = 2'b11;

  always @(posedge clock) begin
    case (C)
      Reset: Q = 4'b0000;
      Load:  Q = D;
      Shift: Q = {Q[2:0], SI};
    endcase
  end
endmodule
