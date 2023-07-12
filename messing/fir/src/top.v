module top
    ( input clk
    , output[2:0] ld5
    , output[2:0] ld6
    , output[2:0] ld7
    , output[2:0] ld8
    );

    reg rst = 1;
    always @(posedge clk) begin
        rst <= 0;
    end

    \proj::main::main main
        ( .clk_i(clk)
        , .rst_i(rst)
        , .output__({ld5, ld6, ld7, ld8})
        );
endmodule

