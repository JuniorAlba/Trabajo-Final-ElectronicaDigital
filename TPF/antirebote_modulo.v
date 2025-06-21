module antirrebote_modulo (
    input wire clk,
    input wire btn,     // entrada con rebotes
    output reg btn_clean     // salida limpia
);
    //tiempo que debe suceder para habilitarse la salida
    //El rebote mecánico típico de un pulsador dura entre 5 ms y 20ms
    //Por lo tanto, como el reloj interno de nuestra  FPGA es de 12MHz,
    //es decir, 83,33ns por ciclo, como resultado si queremos esperar 20ms
    //debemos esperar 240000 ciclos de reloj.
    parameter tiempo_antirebote = 240000; // 20ms en ciclos de reloj a 12MHz
    reg [31:0] contador = 0;  // esto cuenta el tiempo que se encuentra activada la entrada
    reg estado = 0;           // estado interno
    always @(posedge clk) begin
        if (btn != estado) begin
            // cambio detectado en la entrada, se reinicia contador
            estado <= btn;
            contador <= 0;
        end else if (contador < tiempo_antirebote) begin
            // si no hay cambio se incrementa el contador hasta alcanzar el tiempo necesario
            contador <= contador + 1;
        end else begin
            // se cumplió el tiempo, se actualiza la salida
            btn_clean <= estado;
        end
    end
endmodule