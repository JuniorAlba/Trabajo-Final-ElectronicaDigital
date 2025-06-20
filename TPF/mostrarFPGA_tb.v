`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module mostrarFPGA_tb;
    parameter DURATION = 10;

    reg clk = 0;
    reg reset = 0;
    reg BTN1 = 0;
    reg BTN4 = 0;
    wire [3:0] leds;
    

    // Instanciamos el módulo top
    mostrarFPGA uut (
        .CLK(clk),
        .RST(reset),
        .BTN1(BTN1),
        .BTN4(BTN4),
        .LED0(leds[0]),
        .LED1(leds[1]),
        .LED2(leds[2]),
        .LED3(leds[3])
    );

    // Reloj de 10ns (100 MHz)
    always #5 clk = ~clk;

    // Simulación de pulsos de botón con rebote
    initial begin
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, mostrarFPGA_tb);
            reset = 1;
        #20;
        reset = 0;

        //secuencia de entrada
        #15
        BTN1 = 1;
        BTN4 = 0;

        #15
        BTN1 = 1;
        BTN4 = 1;

        #15
        BTN1 = 0;
        BTN4 = 1;

        #15
        BTN1 = 0;
        BTN4 = 0;
        //secuencia de entrada
        #15
        BTN1 = 1;
        BTN4 = 0;

        #15
        BTN1 = 1;
        BTN4 = 1;

        #15
        BTN1 = 0;
        BTN4 = 1;

        #15
        BTN1 = 0;
        BTN4 = 0;
        //secuencia de entrada

        #15
        BTN1 = 1;
        BTN4 = 0;

        #15
        BTN1 = 1;
        BTN4 = 1;

        #15
        BTN1 = 0;
        BTN4 = 1;
        
        #15
        BTN1 = 0;
        BTN4 = 0;
        //secuencia de entrada

        #15
        BTN1 = 1;
        BTN4 = 0;

        #15
        BTN1 = 1;
        BTN4 = 1;

        #15
        BTN1 = 0;
        BTN4 = 1;
        
        #15
        BTN1 = 0;
        BTN4 = 0;
        //secuencia de entrada

        #15
        BTN1 = 1;
        BTN4 = 0;

        #15
        BTN1 = 1;
        BTN4 = 1;

        #15
        BTN1 = 0;
        BTN4 = 1;

        #15
        BTN1 = 0;
        BTN4 = 0;
        //secuencia de entrada

        #15
        BTN1 = 1;
        BTN4 = 0;

        #15
        BTN1 = 1;
        BTN4 = 1;

        #15
        BTN1 = 0;
        BTN4 = 1;

        #15
        BTN1 = 0;
        BTN4 = 0;
        //secuencia de entrada

        #15
        BTN1 = 1;
        BTN4 = 0;

        #15
        BTN1 = 1;
        BTN4 = 1;

        #15
        BTN1 = 0;
        BTN4 = 1;

        #15
        BTN1 = 0;
        BTN4 = 0;

        #15
        //sencuencia de salida
        BTN1 = 0;
        BTN4 = 1;

        #15
        BTN1 = 1;
        BTN4 = 1;

        #15
        BTN1 = 1;
        BTN4 = 0;

        #15
        BTN1 = 0;
        BTN4 = 0;
        #15
         //sencuencia de salida
        BTN1 = 0;
        BTN4 = 1;

        #15
        BTN1 = 1;
        BTN4 = 1;

        #15
        BTN1 = 1;
        BTN4 = 0;

        #15
        BTN1 = 0;
        BTN4 = 0;
        #15
         //sencuencia de salida
        BTN1 = 0;
        BTN4 = 1;

        #15
        BTN1 = 1;
        BTN4 = 1;

        #15
        BTN1 = 1;
        BTN4 = 0;

        #15
        BTN1 = 0;
        BTN4 = 0;
        #15
         //sencuencia de salida
        BTN1 = 0;
        BTN4 = 1;

        #15
        BTN1 = 1;
        BTN4 = 1;

        #15
        BTN1 = 1;
        BTN4 = 0;

        #15
        BTN1 = 0;
        BTN4 = 0;
        #15
         //sencuencia de salida
        BTN1 = 0;
        BTN4 = 1;

        #15
        BTN1 = 1;
        BTN4 = 1;

        #15
        BTN1 = 1;
        BTN4 = 0;

        #15
        BTN1 = 0;
        BTN4 = 0;
        #15
         //sencuencia de salida
        BTN1 = 0;
        BTN4 = 1;

        #15
        BTN1 = 1;
        BTN4 = 1;

        #15
        BTN1 = 1;
        BTN4 = 0;

        #15
        BTN1 = 0;
        BTN4 = 0;
        #15
         //sencuencia de salida
        BTN1 = 0;
        BTN4 = 1;

        #15
        BTN1 = 1;
        BTN4 = 1;

        #15
        BTN1 = 1;
        BTN4 = 0;

        #15
        BTN1 = 0;
        BTN4 = 0;
        #15


        #(DURATION) $display("End of simulation");
        $finish;
    end

endmodule