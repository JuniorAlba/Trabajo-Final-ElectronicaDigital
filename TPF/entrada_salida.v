module entrada_salida(
    input clk,
    input wire A,
    input wire B,
    output wire [2:0]estado,
    output wire [1:0]salida
);

ffD flipflipD0(
    .D(D0),
    .Q(estado[0]),
    .Clk(clk)
);

ffD flipflipD1(
    .D(D1),
    .Q(estado[1]),
    .Clk(clk)
);

ffD flipflipD2(
    .D(D2),
    .Q(estado[2]),
    .Clk(clk)
);

wire Q0 = estado[0];
wire Q1 = estado[1];
wire Q2 = estado[2];
assign D2 = (~A & B & ~Q2 & Q1 & Q0) |
            ( A & B & Q1 & ~Q0) |
            ( A & Q2 & Q1 & ~Q0) |
            (~A & B & Q2 & ~Q1 & Q0) |
            ( A & Q2 & ~Q1 & ~Q0);

assign D1 = ( A & B & ~Q2 & Q0) |
            (~A & B & ~Q1 & ~Q0)      |
            (~A & B & ~Q2 & Q1 & ~Q0) |
            (A & ~B &  Q2 &  Q1 & ~Q0) |
            (A & ~B &  Q2 & ~Q1 & ~Q0) |
            (A & B &  Q2 & ~Q1 & Q0);

assign D0 = (B & Q2 & ~Q1 & Q0)|
            (B & ~Q2 & Q1 & Q0)|
            (A & ~Q2 & Q0)|
            (A & ~B & ~Q2 & ~Q1);

assign salida[0] = (Q0 & ~Q1 & Q2 & ~A & ~B);
assign salida[1] = (~Q0 & Q1 & Q2 & ~A & ~B);






endmodule