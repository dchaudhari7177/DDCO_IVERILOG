module test_bench;

    reg A,B,C;
    wire D;

    circuit M1(A,B,C,D);

    initial begin
        A = 0; B = 0; C = 0;
        #20
        A = 0; B = 0; C = 1;
        #20
        A = 0; B = 1; C = 0;
        #20
        A = 0; B = 1; C = 1;
        #20
        A = 1; B = 0; C = 1;
        #20
        A = 1; B = 0; C = 0;
        #20
        A = 1; B = 1; C = 0;
        #20
        A = 1; B = 1; C = 1;
    end

    initial begin
        $monitor($time, "a = %b, b = %b, c = %b, d = %b", A, B, C, D);
    end

    initial begin
        $dumpfile("sample.vcd");
        $dumpvars(0, test_bench);
    end
endmodule;