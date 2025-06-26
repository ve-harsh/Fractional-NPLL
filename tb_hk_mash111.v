`timescale  1ns / 1ps

module tb_hk_mash111;

// mash111 Parameters
parameter PERIOD = 10;
parameter WIDTH  = 9;
parameter A_GAIN = 2;
parameter OUT_REG = 1;

// mash111 Inputs
reg   clk                                  = 0 ;
reg   rst_n                                = 0 ;
reg   [WIDTH-1:0]  x_i                     = 0 ;

// mash111 Outputs
wire  [3:0]  y_o                           ;
wire  [WIDTH-1:0]  e_o                     ;

// ============================================
// VCD Dump for GTKWave
// ============================================
initial begin
    $dumpfile("mash111.vcd");             // Output VCD file
    $dumpvars(0, tb_hk_mash111);          // Dump all signals in this module
end

// ============================================
// Clock generation
// ============================================
initial begin
    forever #(PERIOD/2) clk = ~clk;
end

// ============================================
// Reset generation
// ============================================
initial begin
    #(PERIOD*2) rst_n = 1;
end

// ============================================
// File output setup
// ============================================
integer dout_file;
initial begin
    dout_file = $fopen("mash111-hkefm-data-9bit-a2-reg-new.txt", "w");
    if (dout_file == 0) begin 
        $display("ERROR: Could not open file.");
        $stop;
    end
end

// ============================================
// Save output data to file on every clock edge
// ============================================
always @(posedge clk) begin
    $fdisplay(dout_file, "%d", $signed(y_o));    // Save signed data
end    

// ============================================
// Instantiate DUT (hk_mash111)
// ============================================
hk_mash111 #(
    .WIDTH(WIDTH),
    .A_GAIN(A_GAIN),
    .OUT_REG(OUT_REG)
) u_hk_mash111 (
    .clk(clk),
    .rst_n(rst_n),
    .x_i(x_i),
    .y_o(y_o),
    .e_o(e_o)
);

// ============================================
// Apply input stimulus
// ============================================
initial begin
    // Set x_i for alpha = 15/37 ≈ 0.4054 --> x_i = round(0.4054 * 512) = 208
    x_i = 208;
    #(PERIOD * 10000);
    $finish;
end

endmodule
