`timescale 1ns / 1ps

module fasstb;

    reg [2:0] i1;
    reg i2;
    wire [2:0] sum1;
    wire Cout1;

    fass dut (i1, i2, sum1, Cout1);

    initial begin
        $dumpfile("fass.vcd");
        $dumpvars(0, fasstb);

        // Test cases
        i1 = 3'b000; i2 = 1'b0; #10;
        i1 = 3'b001; i2 = 1'b0; #10;
        i1 = 3'b010; i2 = 1'b0; #10;
        i1 = 3'b011; i2 = 1'b0; #10;
        i1 = 3'b100; i2 = 1'b0; #10;
        i1 = 3'b101; i2 = 1'b0; #10;
        i1 = 3'b110; i2 = 1'b0; #10;
        i1 = 3'b111; i2 = 1'b0; #10;

        i1 = 3'b000; i2 = 1'b1; #10;
        i1 = 3'b001; i2 = 1'b1; #10;
        i1 = 3'b010; i2 = 1'b1; #10;
        i1 = 3'b011; i2 = 1'b1; #10;
        i1 = 3'b100; i2 = 1'b1; #10;
        i1 = 3'b101; i2 = 1'b1; #10;
        i1 = 3'b110; i2 = 1'b1; #10;
        i1 = 3'b111; i2 = 1'b1; #10;

        $finish;
    end

    initial begin
        $monitor("i1=%b, i2=%b, sum1=%b, Cout1=%b", i1, i2, sum1, Cout1);
    end

endmodule