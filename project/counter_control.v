module counter_control(
    input clk,
    input rst_n,        // Active-low reset
    input mode,         // Mode selection: 0 for Ring Counter, 1 for Johnson Counter
    output reg [3:0] q  // 4-bit output
);

    // Internal registers to store the state of the counters
    reg [3:0] ring_counter;
    reg [3:0] johnson_counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset both counters to zero
            ring_counter <= 4'b0001;  // Set initial state for Ring Counter to avoid undefined state
            johnson_counter <= 4'b0000;  // Reset Johnson Counter
        end else begin
            if (mode == 0) begin
                // Ring Counter Logic: Shift left, MSB is fed back to LSB
                ring_counter <= {ring_counter[2:0], ring_counter[3]};
                q <= ring_counter;  // Output the ring counter
            end else begin
                // Johnson Counter Logic: Complement MSB and feed it to LSB
                johnson_counter[3] <= ~johnson_counter[0];
                johnson_counter[2:0] <= johnson_counter[3:1];
                q <= johnson_counter;  // Output the johnson counter
            end
        end
    end

endmodule
