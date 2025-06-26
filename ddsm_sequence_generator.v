// ddsm_sequence_generator.v
module ddsm_sequence_generator (
    input clk,
    input rst,
    input [3:0] alpha_frac, // Value between 1 and 15
    output reg seq_out
);
    reg [4:0] accumulator; // 5-bit to avoid overflow

    always @(posedge clk) begin
        if (rst) begin
            accumulator <= 0;
            seq_out <= 0;
        end else begin
            accumulator <= accumulator + alpha_frac;
            if (accumulator >= 16) begin
                accumulator <= accumulator - 16;
                seq_out <= 1;
            end else begin
                seq_out <= 0;
            end
        end
    end
endmodule
