module trab (
    input [2:0]rqstFloor,
    input [3:0]a,
    output reg [6:0]b
);

reg [1:0] up;
reg [1:0] down;
reg [1:0] doorIsOpen;
reg [1:0] dumbInTheDoor;
reg [2:0]currentFloor;

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
            currentFloor <= 3'd0;
        end
        4'b0001: begin
            if (currentFloor == 2 || currentFloor = 0) begin
                b[0] <= 1;
                b[1] <= 0;
                b[2] <= 0;
                b[3] <= 1;
                b[4] <= 1;
                b[5] <= 1;
                b[6] <= 1;
                currentFloor <= 3'd1;
            end
        end
        4'b0010: begin
            if (currentFloor == 1 || currentFloor == 3) begin
                b[0] <= 0;
                b[1] <= 0;
                b[2] <= 1;
                b[3] <= 0;
                b[4] <= 0;
                b[5] <= 1;
                b[6] <= 0;
                currentFloor <= 3'd2;
            end
        end
        4'b0100: begin
            if (currentFloor == 2 || currentFloor == 4) begin
                b[0] <= 0;
                b[1] <= 0;
                b[2] <= 0;
                b[3] <= 0;
                b[4] <= 1;
                b[5] <= 1;
                b[6] <= 0;
                currentFloor <= 3'd3;
            end
        end
        4'b1000: begin
            if (currentFloor == 3) begin
                b[0] <= 1;
                b[1] <= 0;
                b[2] <= 0;
                b[3] <= 1;
                b[4] <= 1;
                b[5] <= 0;
                b[6] <= 0;
                currentFloor <= 3'd4;
            end
        end
    endcase
end
endmodule