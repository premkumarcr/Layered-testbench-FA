module full_adder (
    input  logic a,
    input  logic b,
    input  logic cin,
    output logic sum,
    output logic carry
);

    always_comb begin
        sum   = a ^ b ^ cin;
        carry = (a & b) | (b & cin) | (a & cin);
    end

endmodule
