module alu (
    input [7:0] a,
    input [7:0] b,
    input [1:0] opcode,
    output reg [7:0] result
);
    always @(*) begin
        case (opcode)
            2'b00: result = a & b; // AND
            2'b01: result = a | b; // OR
            2'b10: result = ~(a & b); // NAND
            2'b11: result = ~(a | b); // NOR
            default: result = 8'b00000000; // Default case
        endcase
    end
endmodule
