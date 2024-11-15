module tb_counter_control;

    reg clk;
    reg rst_n;       // Active-low reset
    reg mode;        // Mode selection: 0 for Ring Counter, 1 for Johnson Counter
    wire [3:0] q;    // 4-bit output from the counter control module

    // Instantiate the counter control module (uut = Unit Under Test)
    counter_control uut (
        .clk(clk),
        .rst_n(rst_n),  // Active-low reset
        .mode(mode),
        .q(q)
    );

    // Generate clock signal with a period of 10 time units (frequency = 100 MHz)
    always #5 clk = ~clk;  

    // Testbench stimulus
    initial begin
        // Initialize inputs
        clk = 0;        // Clock starts at 0
        rst_n = 0;      // Assert reset (active-low reset)
        mode = 0;       // Start with Ring Counter mode

        // Apply reset for 10 time units
        #10 rst_n = 1;  // De-assert reset (active-low reset)

        // Observe Ring Counter behavior for 50 time units
        #50 mode = 1;   // Switch to Johnson Counter after 50 time units

        // Observe Johnson Counter behavior for 200 time units
        #200 $finish;   // End simulation after 200 time units
    end

    // Monitor outputs: Print the mode and output 'q' values at each change
    initial begin
        $monitor("Time = %0t | mode = %b | q = %b", $time, mode, q);
    end

    // Dump waveforms for debugging: This creates a .vcd file for waveform viewing in a viewer like GTKWave
    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, tb_counter_control);
    end

endmodule
