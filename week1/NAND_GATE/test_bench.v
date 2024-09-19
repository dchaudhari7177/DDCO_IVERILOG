module nand_test;
    reg a,b;
    wire y;

    nand nand_gate(y,a,b);

    initial begin
        #000 a = 0; b = 0;
        #100 a = 0; b = 1;
        #100 a = 1; b = 0;
        #100 a = 1; b = 1;
    end

    initial begin
        $monitor($time,"a=%b,b=%b,y=%b",a,b,y);
    end
    
    initial begin
        $dumpfile("nand_test.vcd");
        $dumpvars(0, nand_test);
    end
endmodule