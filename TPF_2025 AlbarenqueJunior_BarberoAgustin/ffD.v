module ffD(
    input D,
    output reg Q=0,
    input Clk
);
always @(posedge Clk) begin
    Q<=D;
end
endmodule