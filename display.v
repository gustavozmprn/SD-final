module display (
    input [3:0]a,
    output reg [6:0]b
);

always@(a) begin
    case(a)
        4'b0000: begin
            b[0] <= 1;
            b[1] <= 1;
            b[2] <= 1;
            b[3] <= 1;
            b[4] <= 1;
            b[5] <= 1;
            b[6] <= 0;
        end
        4'b0001: begin
            b[0] <= 1;
            b[1] <= 0;
            b[2] <= 0;
            b[3] <= 1;
            b[4] <= 1;
            b[5] <= 1;
            b[6] <= 1;
        end
        4'b0010: begin
            b[0] <= 0;
            b[1] <= 0;
            b[2] <= 1;
            b[3] <= 0;
            b[4] <= 0;
            b[5] <= 1;
            b[6] <= 0;
        end
        4'b0100: begin
            b[0] <= 0;
            b[1] <= 0;
            b[2] <= 0;
            b[3] <= 0;
            b[4] <= 1;
            b[5] <= 1;
            b[6] <= 0;
        end
        4'b1000: begin
            b[0] <= 1;
            b[1] <= 0;
            b[2] <= 0;
            b[3] <= 1;
            b[4] <= 1;
            b[5] <= 0;
            b[6] <= 0;
        end
    endcase
end
endmodule