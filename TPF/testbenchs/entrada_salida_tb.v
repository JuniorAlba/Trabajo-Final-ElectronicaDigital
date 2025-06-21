`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module entrada_salida_tb;
    parameter DURATION = 10;

    reg clk = 0;
    reg A;
    reg B;
    wire [2:0]estado;
    wire [1:0]salida;
    // Instanciamos el módulo top
    entrada_salida uut (
        .clk(clk),
        .A(A),
        .B(B),
        .estado(estado),
        .salida(salida)
    );

    // Reloj de 10ns (100 MHz)
    always #5 clk = ~clk;

    // Simulación de pulsos de botón con rebote
    initial begin
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, entrada_salida_tb);
        A = 1;
        B = 0;

        #50
        A = 1;
        B = 1;

        #50
        A = 0;
        B = 1;

        #50
        A = 0;
        B = 0;

        #50
        #(DURATION) $display("End of simulation");
        $finish;
    end

endmodule