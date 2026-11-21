class generator;

    transaction trans;
    mailbox #(transaction) gen2driv;

    function new(mailbox #(transaction) gen2driv);
        this.gen2driv = gen2driv;
    endfunction

    task main();
        int unsigned start_value;
        int unsigned stimulus;

        // Randomize the starting point, then exercise all 8 input combinations.
        start_value = $urandom_range(0, 7);

        repeat(8)
        begin
            trans = new();
            stimulus = start_value;
            start_value = (start_value + 1) % 8;

            trans.a   = (stimulus >> 2) & 1;
            trans.b   = (stimulus >> 1) & 1;
            trans.cin = stimulus & 1;

            trans.display("Generator");
            gen2driv.put(trans);
        end
    endtask

endclass
