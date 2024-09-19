module or_test;

    reg a, b;
    wire y;

    // Instantiate the OR gate
    or or_gate(y, a, b);

    initial begin
        #100 a = 0; b = 1;
        #100 a = 1; b = 0;
        #100 a = 1; b = 1;
        #100 a = 0; b = 0;
    end

    initial begin
        $monitor($time, "a=%b, b=%b, y=%b", a, b, y);
    end

    initial begin
        // Create a VCD file for waveform simulation
        $dumpfile("or_test.vcd");
        $dumpvars(0, or_test);
    end
    
endmodule