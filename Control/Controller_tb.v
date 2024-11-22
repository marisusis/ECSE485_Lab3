module Controller_tb;

  reg clock, start;
  wire [1:0] QControl, AControl;
  wire adderControl, MControl, done;

  ControlLogic CONTROL (
      clock,
      start,
      QControl,
      AControl,
      done,
      MControl,
      adderControl
  );

  initial begin
    clock = 0;
    forever #1 clock = ~clock;
  end

  initial begin
    #5;
    start = 1;
    #4;


  end

endmodule
