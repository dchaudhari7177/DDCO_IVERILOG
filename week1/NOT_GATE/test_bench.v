module not_test;
    reg a;
    wire y;
    not not_gate(y, a);
    initial begin
        #0 a = 0;
        #100 a = 1;
        #100 a = 0;
        #100 a = 1;
    end
    initial begin
        $monitor($time, "a=%b, y=%b", a,y);
    end
    initial begin
        $dumpfile("not_test.vcd");
        $dumpvars(0, not_test);
    end
endmodule