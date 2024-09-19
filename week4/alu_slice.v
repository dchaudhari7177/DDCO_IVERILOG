module alu_slice (
    input wire i0, i1, Cin,         
    input wire [1:0] op,            
    output wire O, Cout             
);
    wire sum, and_out, or_out, xor_out, sub_i1, xor_i0_i1;
    wire [3:0] mux_in;            

    and2 and_gate (.i0(i0), .i1(i1), .o(and_out));
    or2 or_gate (.i0(i0), .i1(i1), .o(or_out));

    xor2 xor_gate (.i0(i0), .i1(i1), .o(xor_i0_i1));

    wire sum_out, carry_out;
    xor2 sum_xor (.i0(xor_i0_i1), .i1(Cin), .o(sum_out)); 
    and2 carry_and1 (.i0(i0), .i1(i1), .o(carry_out));   
    and2 carry_and2 (.i0(Cin), .i1(xor_i0_i1), .o(Cout)); 

    assign mux_in[0] = sum_out;  
    assign mux_in[1] = sum_out; 
    assign mux_in[2] = and_out;
    assign mux_in[3] = or_out;

    mux4 mux (.i(mux_in), .j1(op[1]), .j0(op[0]), .o(O));

endmodule