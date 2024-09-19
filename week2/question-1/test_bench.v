module test_bench;
    
    reg a,b,c;
    wire d,e;

    sample_circuit M1(a,b,c,d,e);
    initial begin
        a = 0; b = 0; c = 0;
        #20
        a = 0; b = 0; c = 1;
        #20
        a = 0; b = 1; c = 0;
        #20
        a = 0; b = 1; c = 1;
        #20
        a = 1; b = 0; c = 0;
        #20
        a = 1; b = 0; c = 1;
        #20
        a = 1; b = 1; c = 0;
        #20
        a = 1; b = 1; c = 1;
    end

    initial begin
        $monitor($time, "a = %b, b = %b, c = %b, d = %b, e = %b", a, b, c, d, e);
    end

    initial begin
        $dumpfile("sample.vcd");
        $dumpvars(0, test_bench);
    end

endmodule