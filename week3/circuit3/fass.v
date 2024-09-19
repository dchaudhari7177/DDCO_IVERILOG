module fass(
    input wire [2:0] i1,
    input wire i2,
    output wire [2:0] sum1,
    output wire Cout1
);

    wire c;
    full_adder fa1 (i1[0], i2, 1'b0, sum1[0], c);
    full_adder fa2 (i1[1], 1'b0, c, sum1[1], c);
    full_adder fa3 (i1[2], 1'b0, c, sum1[2], Cout1);
endmodule

module full_adder(
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule