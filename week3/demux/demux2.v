module demux2 (
    input wire in,
    input wire sel,
    output wire y0,
    output wire y1
);

    assign y0 = (~sel) ? in : 1'b0;
    assign y1 = sel ? in : 1'b0;

endmodule
