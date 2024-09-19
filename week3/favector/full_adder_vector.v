module full_adder_vector(
  input  wire [2:0] i1,
  input  wire i2,
  output wire [1:0] sum1,
  output wire cout1
);

  wire c_out;

  full_adder fa0 (
    .a(i1[0]),
    .b(i2),
    .cin(1'b0),
    .sum(sum1[0]),
    .cout(c_out)
  );

  full_adder fa1 (
    .a(i1[1]),
    .b(1'b0),
    .cin(c_out),
    .sum(sum1[1]),
    .cout(cout1)
  );

endmodule