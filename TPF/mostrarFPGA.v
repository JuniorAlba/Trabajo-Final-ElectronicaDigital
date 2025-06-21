module mostrarFPGA(
    input CLK,
    input RST,
    input wire BTN1,
    input wire BTN4,
    output wire LED0,
    output wire LED1,
    output wire LED2,
    output wire LED3
);

wire BTN2_clean;
wire BTN1_clean;
antirrebote_modulo rebote1(
    .clk(CLK),
    .btn(~BTN1),
    .btn_clean(BTN1_clean)
);
antirrebote_modulo rebote2(
    .clk(CLK),
    .btn(~BTN4),
    .btn_clean(BTN2_clean)
);
reg A = 0, B = 0;

wire [2:0]estado;
wire [1:0]salida;
entrada_salida gestion(
    .clk(CLK),
    .A(BTN1_clean),
    .B(BTN2_clean),
    .estado(estado),
    .salida(salida)
);

wire [2:0] num;
wire lleno;
contador cuenta(
    .clk(CLK),
    .reset(RST),
    .z1(salida[0]),
    .z2(salida[1]),
    .c(num),
    .lleno(lleno)
);
assign LED0 = num[0];
assign LED1 = num[1];
assign LED2 = num[2];
assign LED3 = lleno;



endmodule