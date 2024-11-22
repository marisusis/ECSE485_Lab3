
module ControlLogic( clock, start, QCnt, ACnt, doneCnt, MCnt, adderCnt, A, adderOut);
	input clock, start;
	input [3:0] A, adderOut;
	output doneCnt, MCnt, adderCnt;
	output [2:0] QCnt;
	output[1:0] ACnt;

	reg adderCnt, doneCnt, MCnt;
	reg [2:0] QCnt;
	reg [1:0] ACnt;

	parameter s0 = 2'b00, 
		  s1 = 2'b01, 
		  s2 = 2'b10, 
		  start_state=2'b11 ;
	
	parameter Load= 3'b000, Reset= 3'b001, Shift= 3'b010, Hold= 3'b011,
		  Add = 1'b0 , Sub  = 1'b1,
		  LD  = 1'b1 , HD   = 1'b0,
		  Set1 = 3'b100;

	reg [2:0] NEXT_STATE; 
	reg [2:0] count;


always @(posedge clock) begin
	case(NEXT_STATE)
		start_state:
		begin
			case(start)
			1'b1: begin
				{adderCnt, ACnt , MCnt, QCnt, doneCnt} =
				{     Add, Reset, LD  , Load, 1'b0};
				NEXT_STATE=s0;
				count = 4;
			      end 
			  1'b0:begin
				{adderCnt, ACnt , MCnt, QCnt, doneCnt} =
				{Add     , Hold , HD  , Hold, 1'b1};
				NEXT_STATE = start_state;
				count = 0;
			     end
		     endcase
	        end
		s0: begin
			ACnt = Shift;
			QCnt = Shift;
			NEXT_STATE = s1;
		    end

		s1: begin
			QCnt = Hold;
			ACnt = Hold;
			adderCnt = Sub;
			NEXT_STATE = s2;
		end

		s2: begin
			if (adderOut[3] == 1) begin
				adderCnt = Add;
				ACnt = Hold;
			end else begin
				QCnt = Set1;
				ACnt = Load;
			end

			NEXT_STATE = s0;

			count = count - 1;

			if (count == 0) begin
				ACnt = Load;
				doneCnt = 1;
				NEXT_STATE = start_state;
			end

			

		end

		default: begin
			{adderCnt, ACnt , MCnt, QCnt} =
			{Add     , Hold , HD  , Hold};
			NEXT_STATE = start_state; 
		end
	endcase
end

endmodule
