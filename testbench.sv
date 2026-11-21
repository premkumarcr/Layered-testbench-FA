//SRN:PES2UG24EC152
//NAME:VIVEK REDDY A

`include "interface.sv"
`include "full_adder.sv"
`include "environment.sv"

module tb;

    intf i_intf();
    environment env;

    full_adder dut (
        .a(i_intf.a),
        .b(i_intf.b),
        .cin(i_intf.cin),
        .sum(i_intf.sum),
        .carry(i_intf.carry)
    );

    initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        env = new(i_intf);
        env.run();
    end

endmodule
