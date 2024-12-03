module divider #(
    parameter N = 4
) (
    input clock,
    input reset,
    input [N-1:0] dividend,
    input [N-1:0] divisor,
    output reg [N-1:0] Q,
    output reg [N-1:0] A,
    output reg done
);

reg [N-1:0] M;
reg [4:0] count;

always @(posedge clock) begin
    if (reset) begin
        Q = dividend;
        M = divisor;
        A = 0;
        count = N;
        done = 0;
    end 
    else if (done) begin
    end
    else begin

        A = {A[N-2:0], Q[N-1]};
        Q = {Q[N-2:0], 1'b0};

        A = A - M;

        if (A[N-1] == 1) begin
            Q[0] = 0;
            A = A + M;
        end else begin
            Q[0] = 1;
        end

        count = count - 1;

        if (count == 0)
            done = 1;

    end
end

endmodule;

