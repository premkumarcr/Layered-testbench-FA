class scoreboard;

    mailbox mon2scb;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    task main;
        transaction trans;
        bit expected_sum;
        bit expected_carry;
        int passed;

        passed = 0;

        repeat(8)
        begin
            mon2scb.get(trans);

            expected_sum   = trans.a ^ trans.b ^ trans.cin;
            expected_carry = (trans.a & trans.b) |
                             (trans.b & trans.cin) |
                             (trans.a & trans.cin);

            if ((expected_sum == trans.sum) &&
                (expected_carry == trans.carry))
            begin
                passed++;
                $display("PASS: Result is as Expected");
            end
            else
            begin
                $fatal(1, "FAIL: a=%0b b=%0b cin=%0b; Expected sum=%0b carry=%0b, Got sum=%0b carry=%0b",
                       trans.a, trans.b, trans.cin,
                       expected_sum, expected_carry, trans.sum, trans.carry);
            end

            trans.display("Scoreboard");
        end

        $display("TEST SUMMARY: %0d/8 transactions passed.", passed);
    endtask

endclass
