`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module contador_tb;
    parameter DURATION = 10;

    reg clk = 0;
    reg A;
    reg B;
    wire [2:0]c;
    wire lleno;
    // Instanciamos el módulo top
    contador uut (
        .clk(clk),
        .Z1(A),
        .Z0(B),
        .c(c),
        .lleno(lleno)
    );

    // Reloj de 10ns (100 MHz)
    always #5 clk = ~clk;

    // Simulación de pulsos de botón con rebote
    initial begin
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, contador_tb);
        A = 0;
        B = 1;

        #50
        A = 0;
        B = 1;

        #50

        A = 1;
        B = 0;
        #(DURATION) $display("End of simulation");
        $finish;
    end

endmodule