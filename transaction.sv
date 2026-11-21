class transaction;

    rand bit a;
    rand bit b;
    rand bit cin;

    bit sum;
    bit carry;

    function void display(string tag = "Transaction");
        $display("[%s] a=%0b b=%0b cin=%0b sum=%0b carry=%0b",
                 tag, a, b, cin, sum, carry);
    endfunction

endclass
