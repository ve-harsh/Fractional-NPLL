`timescale 1ns / 1ps

module tb_ddsm_sequence_generator;
    reg clk;
    reg rst;
    reg [3:0] alpha_frac;
    wire seq_out;

    ddsm_sequence_generator uut (
        .clk(clk),
        .rst(rst),
        .alpha_frac(alpha_frac),
        .seq_out(seq_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Stimulus
    integer i;
    initial begin
        $dumpfile("tb_ddsm_sequence_generator.vcd");
        $dumpvars(0, tb_ddsm_sequence_generator);

        rst = 1;
        alpha_frac = 0;
        #20 rst = 0;

        // Test alpha_frac values from 1 to 15
        for (i = 1; i <= 15; i = i + 1) begin
            alpha_frac = i[3:0];
            rst = 1;
            #10 rst = 0;

            #200; // Run for 200ns per alpha value
        end

        $finish;
    end
endmodule
