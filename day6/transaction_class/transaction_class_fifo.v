
class transaction;
    rand bit  wr_enb;
    rand bit  rd_enb;
    rand bit [7:0]  data_in;

    bit [7:0]  data_out;
    bit full;
    bit empty;

  constraint c1 { !(wr_enb && rd_enb);}
    function void display(string s);
        $display("[%s] wr_enb=%0b rd_enb=%0b data_in=%0h data_out=%0h full=%0b empty=%0b",
                 s, wr_enb, rd_enb, data_in, data_out, full, empty);
    endfunction
endclass
