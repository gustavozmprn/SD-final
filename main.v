module main (
    input[9:0]SW, //input SW;
    input[3:0] KEY, //input BTN;
    output[6:0]HEX0
);
//inputs
input reg regSwitchs;
input reg[3:0] regKeys;
input reg doorOpen;
input reg doorSensor;
input reg outside;

//value regs
reg[1:0] requestFloor;
reg[1:0] actualFloor;
reg[1:0] prevFloor;//usado pra saber se ele pode ou não ir para o próximo

//outputs
output up;
output down;
output complete;

//assigns
assign regKeys = KEY;
assign regSwitchs = SW;
assign doorOpen = SW[6];
assign doorSensor = SW[7];
assign outside = SW[9];

always@(KEY) begin
    case(KEY)
        4'b0001 : begin
            requestFloor <= 2'd1;
        end
        4'b0010 : begin
            requestFloor <= 2'd2;
        end
        4'b0100 : begin
            requestFloor <= 2'd3;
        end
        4'b1000 : begin
            requestFloor <= 2'd4;
        end
    ENDCASE
end
always@(SW) begin
    case(SW)
        4'b0000 : begin
            actualFloor <= 2'd0;
        end
        4'b0001 : begin
            actualFloor <= 2'd1;
            prevFloor <= 2'd1;
            display(SW,HEX0);
        end
        4'b0010 : begin
            actualFloor <= 2'd2;
            prevFloor <= 2'd2;
            display(SW,HEX0);
        end
        4'b0100 : begin
            actualFloor <= 2'd3;
            prevFloor <= 2'd3;
            display(SW,HEX0);
        end
        4'b1000 : begin
            actualFloor <= 2'd4;
            prevFloor <= 2'd4;
            display(SW,HEX0);
        end
    ENDCASE
end
//verify if is going up or going down
if (requestFloor < actualFloor) begin
    down <= 1'b1;
    up <= 1'b0;
    complete <= 1'b0;
    //actualFloor <= actualFloor << 1;
end
if (requestFloor > actualFloor) begin
    down <= 1'b0;
    up <= 1'b1;
    complete <= 1'b0;
    //actualFloor <= actualFloor >> 1;
end
if (requestFloor == actualFloor) begin
    down <= 1'b0;
    up <= 1'b0;
    complete <= 1'b1;
end

endmodule