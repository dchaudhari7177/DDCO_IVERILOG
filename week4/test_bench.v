module alu_tb;

    reg [1:0] op;
    reg [15:0] i0, i1;
    wire [15:0] o;
    wire cout;

    alu m1 (
        op,
        i0,
        i1,
        o,
        cout
    );

    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

        op = 00;
        i0 = 0000000000001111;  // 0000 0000 0000 1111 (15)
        i1 = 0000000000000001;  // 0000 0000 0000 0001 (1)
        #10;
        $display("ADD: i0 = %b, i1 = %b, o = %b, cout = %b", i0, i1, o, cout);

        op = 01;
        i0 = 0000000000010000;  // 0000 0000 0001 0000 (16)
        i1 = 0000000000000101;  // 0000 0000 0000 0101 (5)
        #10;
        $display("SUB: i0 = %b, i1 = %b, o = %b, cout = %b", i0, i1, o, cout);

        op = 10;
        i0 = 0000000011111111;  // 0000 0000 1111 1111
        i1 = 0000111100001111;  // 0000 1111 0000 1111
        #10;
        $display("AND: i0 = %b, i1 = %b, o = %b", i0, i1, o);

        op = 11;
        i0 = 0000000011111111;  // 0000 0000 1111 1111
        i1 = 0000111100001111;  // 0000 1111 0000 1111
        #10;
        $display("OR: i0 = %b, i1 = %b, o = %b", i0, i1, o);

        // Test edge cases for ADD (carry)
        op = 00;
        i0 = 1111111111111111;  // 1111 1111 1111 1111 (-1 in signed)
        i1 = 0000000000000001;  // 0000 0000 0000 0001
        #10;
        $display("ADD (Carry): i0 = %b, i1 = %b, o = %b, cout = %b", i0, i1, o, cout);

        // Test edge cases for SUB (borrow)
        op = 01;
        i0 = 0000000000000000;  // 0000 0000 0000 0000
        i1 = 0000000000000001;  // 0000 0000 0000 0001
        #10;
        $display("SUB (Borrow): i0 = %b, i1 = %b, o = %b, cout = %b", i0, i1, o, cout);

        $finish;
    end

endmodule