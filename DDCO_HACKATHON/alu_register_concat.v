module alu_register_concat (
    input clk,
    input [7:0] a,
    input [7:0] b,
    input [1:0] opcode,
    input [2:0] write_address,
    input [2:0] read_address,
    input write_enable,
    output [7:0] read_data
);
    wire [7:0] alu_result;

    // Instantiate ALU
    alu alu_inst (
        .a(a),
        .b(b),
        .opcode(opcode),
        .result(alu_result)
    );

    // Instantiate Register File
    register_file register_file_inst (
        .clk(clk),
        .write_address(write_address),
        .write_data(alu_result),
        .write_enable(write_enable),
        .read_address(read_address),
        .read_data(read_data)
    );
endmodule
