module contador(
    input clk,
    input wire Z0,
    input wire Z1,
    output wire [2:0] c,
    output wire lleno
);

ffD flipflipD0_contador(
    .D(D0),
    .Q(c[0]),
    .Clk(clk)
);

ffD flipflipD1_contador(
    .D(D1),
    .Q(c[1]),
    .Clk(clk)
);

ffD flipflipD2_contador(
    .D(D2),
    .Q(c[2]),
    .Clk(clk)
);
wire Q0 = c[0];
wire Q1 = c[1];
wire Q2 = c[2];

assign D0 = (~Z1 & Z0 & ~Q2 & ~Q1 & ~Q0) |
            (~Z1 & ~Z0 & ~Q2 &  Q0) |
            (~Z1 & Z0 & Q1 & ~Q0) |
            ( ~Z1 & Z0 &  Q2 & ~Q1 &  ~Q0) |
            ( Z1 & ~Z0 & Q1 & ~Q0)|
            ( Z1 & ~Z0 & Q2 & ~Q1 & ~Q0)|
            (~Z1 & Z0 & Q2 & Q1);

assign D1 = (~Z1 & ~Z0 & Q1) |
            (~Z1 & Q1 & ~Q0) |
            (~Z1 & Z0 & Q2 & Q0) |
            (~Z1 & Z0 & ~Q2 & ~Q1 & Q0) |
            (~Z0 & ~Q2 & Q1 & Q0) |
            (~Z0 & Q2 & Q1 & Q0) |
            ( Z1 & ~Z0 & Q2 & ~Q1 & ~Q0);

assign D2 = (~Z1 & Z0 & ~Q2 & Q1 & Q0) |
            (~Z1 & Q2) |
            (~Z0 & Q2 & Q1) |
            (~Z0 & Q2 & Q0);

assign lleno = Q2 & Q1 & Q0;

endmodule