class driver;

    virtual intf vif;
    mailbox #(transaction) gen2driv;
    mailbox #(transaction) driv2mon;

    function new(virtual intf vif,
                 mailbox #(transaction) gen2driv,
                 mailbox #(transaction) driv2mon);
        this.vif = vif;
        this.gen2driv = gen2driv;
        this.driv2mon = driv2mon;
    endfunction

    task main;
        repeat(8) begin
            transaction trans;
            gen2driv.get(trans);

            // Drive one transaction, allow the combinational DUT to settle,
            // then pass the exact same transaction to the monitor.
            vif.a   = trans.a;
            vif.b   = trans.b;
            vif.cin = trans.cin;
            #1;

            trans.sum   = vif.sum;
            trans.carry = vif.carry;
            driv2mon.put(trans);
            trans.display("Driver");
        end
    endtask

endclass
