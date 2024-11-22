
`include "../ADDSUB_V/addsub.v"
`include "../REGA_V/rega.v"
`include "../REGM_V/regm.v"
`include "../REGQ_V/regq.v"
`include "../Control/Controller.v"

module division (
    clock,
    start,
    Divisor,
    Dividend,
    Ar,
    Qr,
    Done
);
  input clock, start;
  input [3:0] Divisor, Dividend;
  output [3:0] Ar, Qr;
  output Done;

  wire [3:0] Qr, Ar, Mr, Rr;
  wire [1:0] ACnt;
  wire adderCnt, MCnt;

  wire [2:0] QCnt;

  ControlLogic CONTROL (
      clock,
      start,
      QCnt,
      ACnt,
      Done,
      MCnt,
      adderCnt,
	  Ar,
      Rr
  );
  Areg A (
      Ar,
      Rr,
      Qr[3],
      clock,
      ACnt
  );
  Mreg M (
      Mr,
      Divisor,
      clock,
      MCnt
  );
  Qreg Q (
      Qr,
      Dividend,
      clock,
      QCnt
  );
  addsub ADDSUB (
      Rr,
      Ar,
      Mr,
      adderCnt
  );

endmodule
