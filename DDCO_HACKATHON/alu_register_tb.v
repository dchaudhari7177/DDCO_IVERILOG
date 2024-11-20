`timescale 1ns/1ps

module alu_register_tb;
    reg clk;
    reg [7:0] a, b;
    reg [1:0] opcode;
    reg [2:0] write_address, read_address;
    reg write_enable;
    wire [7:0] read_data;

    // Instantiate the top module
    alu_register_concat dut (
        .clk(clk),
        .a(a),
        .b(b),
        .opcode(opcode),
        .write_address(write_address),
        .read_address(read_address),
        .write_enable(write_enable),
        .read_data(read_data)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate clock with a period of 10 units
    end

    initial begin
        // Test cases
        $dumpfile("alu_register.vcd"); // VCD file generation
        $dumpvars(0, alu_register_tb);

        // Initialize inputs
        a = 8'b10101010; 
        b = 8'b11001100; 
        opcode = 2'b00; // AND operation
        write_address = 3'b000; 
        write_enable = 1;

        #10; // Wait for 10 time units
        write_enable = 0; // Disable writing

        opcode = 2'b01; // OR operation
        write_address = 3'b001; 
        write_enable = 1;

        #10;
        write_enable = 0;

        opcode = 2'b10; // NAND operation
        write_address = 3'b010; 
        write_enable = 1;

        #10;
        write_enable = 0;

        opcode = 2'b11; // NOR operation
        write_address = 3'b011; 
        write_enable = 1;

        #10;
        write_enable = 0;

        // Read operation
        read_address = 3'b000; #5;
        $display("Read Data (AND): %b", read_data);

        read_address = 3'b001; #5;
        $display("Read Data (OR): %b", read_data);

        read_address = 3'b010; #5;
        $display("Read Data (NAND): %b", read_data);

        read_address = 3'b011; #5;
        $display("Read Data (NOR): %b", read_data);

        $finish; // End simulation
    end
endmodule
