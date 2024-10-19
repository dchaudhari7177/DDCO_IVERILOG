module ring_counter (
    input wire clk,      // Clock signal
    input wire rst_n,    // Active-low reset signal
    output reg [3:0] q   // 4-bit output for Ring Counter
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 4'b1000;  // On reset, initialize the counter to "1000" with one '1'
        else
            q <= {q[2:0], q[3]};  // Circular left shift (rotate)
    end

endmodule
