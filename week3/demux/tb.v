module TB;

    reg in, sel;
    wire y0, y1;

    demux2 demu2 (
        .in(in),
        .sel(sel),
        .y0(y0),
        .y1(y1)
    );

    initial begin
        $dumpfile("demux1to2_test.vcd");
        $dumpvars(0, TB);
    end

    initial begin
        $monitor($time, " in = %b, sel = %b, y0 = %b, y1 = %b", in, sel, y0, y1);
    end

    initial begin
        in = 1'b0; sel = 1'b0; #5;
        in = 1'b1; sel = 1'b0; #5;
        in = 1'b0; sel = 1'b1; #5;
        in = 1'b1; sel = 1'b1; #5;
        $finish;
    end

endmodule
