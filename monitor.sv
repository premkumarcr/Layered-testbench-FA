class monitor;

    mailbox #(transaction) driv2mon;
    mailbox #(transaction) mon2scb;

    function new(mailbox #(transaction) driv2mon,
                 mailbox #(transaction) mon2scb);
        this.driv2mon = driv2mon;
        this.mon2scb = mon2scb;
    endfunction

    task main;
        repeat(8) begin
            transaction trans;
            driv2mon.get(trans);
            trans.display("Monitor");
            mon2scb.put(trans);
        end
    endtask

endclass
