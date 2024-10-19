module johnson_counter (
    input clk,
    input rst_n,        // Active-low reset
    output reg [3:0] q  // 4-bit output
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 4'b0000;  // Initialize to zero
        else
            q <= {~q[3], q[3:1]};  // Shift left and feed complement of MSB
    end
endmodule
