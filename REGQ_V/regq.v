module Qreg (
    Q,
    D,
    clock,
    C
);
  input clock;
  input [2:0] C;
  input [3:0] D;
  output [3:0] Q;

  reg [3:0] Q;

  parameter Load = 3'b000, Reset = 3'b001, Shift = 3'b010, Hold = 3'b011;
	parameter Set1 = 3'b100;

  always @(posedge clock) begin
    case (C)
      Hold:  ;
      Reset: Q = 4'b0000;
      Load:  Q = D;
      Shift: Q = {Q[2:0], 1'b0};
	    Set1: Q[0] = 1;
    endcase
  end
endmodule
