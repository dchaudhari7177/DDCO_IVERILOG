module counter_control(
    input wire clk,
    input wire rst_n,    // Active-low reset signal
    input wire mode,     // 0 for Ring Counter, 1 for Johnson Counter
    output wire [3:0] q
);

    wire [3:0] q_ring;    // Wire for Ring Counter output
    wire [3:0] q_johnson; // Wire for Johnson Counter output

    // Instantiate Ring Counter
    ring_counter rc (
        .clk(clk),
        .rst_n(rst_n),   // Match port names (rst_n for active-low reset)
        .q(q_ring)
    );

    // Instantiate Johnson Counter
    johnson_counter jc (
        .clk(clk),
        .rst_n(rst_n),   // Match port names (rst_n for active-low reset)
        .q(q_johnson)
    );

    // Control logic: Mux between Ring Counter and Johnson Counter outputs
    assign q = (mode == 0) ? q_ring : q_johnson;

endmodule
