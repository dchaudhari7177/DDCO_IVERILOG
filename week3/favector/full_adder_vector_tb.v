`timescale 1ns / 1ps

module full_adder_vector_tb;

  reg [2:0] i1;
  reg i2;
  wire [1:0] sum1;
  wire cout1;

  full_adder_vector dut (
    .i1(i1),
    .i2(i2),
    .sum1(sum1),
    .cout1(cout1)
  );

  initial begin
    i1 = 3'b000;
    i2 = 1'b0;

    #10;
    $display("i1 = %b, i2 = %b, sum1 = %b, cout1 = %b", i1, i2, sum1, cout1);

    i1 = 3'b001;
    i2 = 1'b1;
    #10;
    $display("i1 = %b, i2 = %b, sum1 = %b, cout1 = %b", i1, i2, sum1, cout1);

    i1 = 3'b011;
    i2 = 1'b0;
    #10;
    $display("i1 = %b, i2 = %b, sum1 = %b, cout1 = %b", i1, i2, sum1, cout1);

    i1 = 3'b111;
    i2 = 1'b1;
    #10;
    $display("i1 = %b, i2 = %b, sum1 = %b, cout1 = %b", i1, i2, sum1, cout1);

    $finish;
  end

  initial begin
    $dumpfile("full_adder_vector.vcd");
    $dumpvars(0, full_adder_vector_tb);
  end

  initial begin
    $monitor("Time=%0d, i1=%b, i2=%b, sum1=%b, cout1=%b", $time, i1, i2, sum1, cout1);
  end
endmodule