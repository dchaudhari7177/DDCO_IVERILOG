module sample_circuit (a,b,c,d,e);
    input a,b,c;
    output d,e;
    wire w1;

    and G1(w1,a,b);
    not G2(e,c);
    or G3(d,w1,e);
endmodule