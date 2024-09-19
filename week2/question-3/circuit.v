module circuit (A,B,C,D);
    
    input A,B,C;
    output D;

    wire w1,w2,w3;

    and G1(w1,B,C);
    or G2(w2,w1,A);
    and G3(w3,A,B);
    or G4(D,w2,w3);
endmodule