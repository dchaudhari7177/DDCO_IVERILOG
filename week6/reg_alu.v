`timescale 1 ns / 100 ps

module reg_alu (
    input wire clk, reset, sel, wr,        
    input wire [1:0] op,                  
    input wire [2:0] rd_addr_a, rd_addr_b, wr_addr,  
    input wire [15:0] d_in,                 
    output wire [15:0] d_out_a, d_out_b,    
    output wire cout                         
);

    reg [15:0] reg_file [7:0];              
    wire [15:0] alu_out;                    
    wire [15:0] reg_a, reg_b;             
    wire alu_cout;                         

    assign reg_a = reg_file[rd_addr_a];     
    assign reg_b = reg_file[rd_addr_b];     
    assign d_out_a = (sel) ? alu_out : reg_a; 
    assign d_out_b = reg_b;                 

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset all registers to 0
            reg_file[0] <= 16'h0000;
            reg_file[1] <= 16'h0000;
            reg_file[2] <= 16'h0000;
            reg_file[3] <= 16'h0000;
            reg_file[4] <= 16'h0000;
            reg_file[5] <= 16'h0000;
            reg_file[6] <= 16'h0000;
            reg_file[7] <= 16'h0000;
        end else if (wr) begin
            reg_file[wr_addr] <= d_in; 
        end
    end

    alu alu_inst (
        .op(op),                // ALU operation
        .i0(reg_a),             // First input (from reg_a)
        .i1(reg_b),             // Second input (from reg_b)
        .o(alu_out),            // ALU output
        .cout(alu_cout)        // Carry out
    );

    assign cout = alu_cout;

endmodule