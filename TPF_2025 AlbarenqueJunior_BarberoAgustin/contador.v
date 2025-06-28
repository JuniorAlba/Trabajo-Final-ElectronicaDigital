module contador(
    input wire clk,
    input wire reset,
    input wire z1,
    input wire z2,
    output reg lleno,
    output reg [2:0] c
);

localparam [2:0]
    S0 = 3'b000,
    S1 = 3'b001,
    S2 = 3'b010,
    S3 = 3'b011,
    S4 = 3'b100,
    S5 = 3'b101,
    S6 = 3'b110,
    S7 = 3'b111;

reg [2:0] state, nextstate;

always@(posedge clk or posedge reset)
begin
    if(reset)
        state <= S0;
    else
        state <= nextstate;
end

always @* begin
    nextstate = state;
    lleno= 0; // Inicializar lleno en 0
    case(state)
        S0: case ({z1, z2})
                2'b00: begin nextstate = S0; lleno=0; end
                2'b10: begin nextstate = S1; lleno=0; end
                2'b01: begin nextstate = S0; lleno=0; end  // No puede suceder
                2'b11: begin nextstate = S0; lleno=0; end  // No puede suceder
            endcase
        S1: case ({z1, z2})
                2'b00: begin nextstate = S1; lleno=0; end
                2'b10: begin nextstate = S2; lleno=0; end
                2'b01: begin nextstate = S0; lleno=0; end
                2'b11: begin nextstate = S1; lleno=0; end  // No puede suceder
            endcase
        S2: case ({z1, z2})
                2'b00: begin nextstate = S2; lleno=0; end
                2'b10: begin nextstate = S3; lleno=0; end
                2'b01: begin nextstate = S1; lleno=0; end
                2'b11: begin nextstate = S2; lleno=0; end  // No puede suceder
            endcase
        S3: case ({z1, z2})
                2'b00: begin nextstate = S3; lleno=0; end
                2'b10: begin nextstate = S4; lleno=0; end
                2'b01: begin nextstate = S2; lleno=0; end
                2'b11: begin nextstate = S3; lleno=0; end  // No puede suceder
            endcase
        S4: case ({z1, z2})
                2'b00: begin nextstate = S4; lleno=0; end
                2'b10: begin nextstate = S5; lleno=0; end
                2'b01: begin nextstate = S3; lleno=0; end
                2'b11: begin nextstate = S4; lleno=0; end  // No puede suceder
            endcase
        S5: case ({z1, z2})
                2'b00: begin nextstate = S5; lleno=0; end
                2'b10: begin nextstate = S6; lleno=0; end
                2'b01: begin nextstate = S4; lleno=0; end
                2'b11: begin nextstate = S5; lleno=0; end  // No puede suceder
            endcase
        S6: case ({z1, z2})
                2'b00: begin nextstate = S6; lleno=0; end
                2'b10: begin nextstate = S7; lleno=1; end
                2'b01: begin nextstate = S5; lleno=0; end
                2'b11: begin nextstate = S6; lleno=0; end  // No puede suceder
            endcase
        S7: case ({z1, z2})
                2'b00: begin nextstate = S7; lleno=1; end
                2'b10: begin nextstate = S7; lleno=0; end  // No puede suceder
                2'b01: begin nextstate = S6; lleno=0; end
                2'b11: begin nextstate = S7; lleno=0; end  // No puede suceder
        default: begin nextstate = S0; lleno=0; end
            endcase
    endcase
end



always@* begin
    case(state)
        S0: c = 3'b000;
        S1: c = 3'b001;
        S2: c = 3'b010;
        S3: c = 3'b011;
        S4: c = 3'b100;
        S5: c = 3'b101;
        S6: c = 3'b110;
        S7: c = 3'b111;
        default: c = 3'b000;
    endcase
end



endmodule