module tb_counter_control;

    reg clk;
    reg rst_n;       // Active-low reset
    reg mode;
    wire [3:0] q;

    // Instantiate the counter control module
    counter_control uut (
        .clk(clk),
        .rst_n(rst_n),   // Active-low reset
        .mode(mode),
        .q(q)
    );

    // Generate clock signal
    always #5 clk = ~clk;

    // Testbench stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        rst_n = 0;  // Assert reset (active-low)
        mode = 0;   // Start with Ring Counter mode

        // Hold reset for a few clock cycles
        #10 rst_n = 1;  // De-assert reset

        // Switch to Johnson Counter after some time
        #50 mode = 1;

        // Run simulation for a while
        #100 $finish;
    end

    // Monitor outputs: Print values at each change
    initial begin
        $monitor("Time = %0t | mode = %b | q = %b", $time, mode, q);
    end

    // Dump waveforms for debugging
    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, tb_counter_control);
    end

endmodule
