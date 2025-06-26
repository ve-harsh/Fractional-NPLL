// uniform_spread_generator.v
module uniform_spread_generator (
    input clk,
    input rst,
    input [3:0] x,     // number of ones to spread
    input [3:0] total, // x + y = total length of sequence period
    output reg seq_out
);
    reg [7:0] acc = 0;
    reg [7:0] count = 0;

    always @(posedge clk) begin
        if (rst) begin
            acc <= 0;
            count <= 0;
            seq_out <= 0;
        end else begin
            acc <= acc + x;
            if (acc >= total) begin
                acc <= acc - total;
                seq_out <= 1;
            end else begin
                seq_out <= 0;
            end
            count <= count + 1;
        end
    end
endmodule
