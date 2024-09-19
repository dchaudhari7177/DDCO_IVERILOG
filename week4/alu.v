module alu (
    input wire [1:0] op,             
    input wire [15:0] i0, i1,        
    output wire [15:0] o,            
    output wire cout                
);
    wire [15:0] Cin, Cout;           

    // First slice (LSB), no carry-in
    alu_slice slice_0 (
        .i0(i0[0]), .i1(i1[0]), .Cin(1'b0), .op(op), .O(o[0]), .Cout(Cout[0])
    );

    // Remaining 15 slices (1 to 15)
    genvar i;
    generate
        for (i = 1; i < 16; i = i + 1) begin : alu_slices
            alu_slice slice (
                .i0(i0[i]), .i1(i1[i]), .Cin(Cout[i-1]), .op(op), .O(o[i]), .Cout(Cout[i])
            );
        end
    endgenerate

    assign cout = Cout[15];
endmodule