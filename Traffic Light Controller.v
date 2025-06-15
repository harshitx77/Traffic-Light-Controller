`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:14 06/09/2025 
// Design Name: 
// Module Name:    Traffic_Light_Controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module traffic_light_controller (
    input wire clk,
    input wire reset,
    output reg [2:0] NS,  // NS = {Red, Yellow, Green}
    output reg [2:0] EW   // EW = {Red, Yellow, Green}
);

    // Define state encodings using parameters
    parameter S0 = 2'b00,  // NS Green, EW Red
              S1 = 2'b01,  // NS Yellow, EW Red
              S2 = 2'b10,  // NS Red, EW Green
              S3 = 2'b11;  // NS Red, EW Yellow

    reg [1:0] state, next_state;
    reg [3:0] timer;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            timer <= 0;
        end else begin
            state <= next_state;
            timer <= (timer == 0) ? 
                     (next_state == S0 || next_state == S2 ? 9 : 2) : timer - 1;
        end
    end

    always @(*) begin
        case (state)
            S0: begin  // NS Green
                NS = 3'b001; EW = 3'b100;
                next_state = (timer == 0) ? S1 : S0;
            end
            S1: begin  // NS Yellow
                NS = 3'b010; EW = 3'b100;
                next_state = (timer == 0) ? S2 : S1;
            end
            S2: begin  // EW Green
                NS = 3'b100; EW = 3'b001;
                next_state = (timer == 0) ? S3 : S2;
            end
            S3: begin  // EW Yellow
                NS = 3'b100; EW = 3'b010;
                next_state = (timer == 0) ? S0 : S3;
            end
        endcase
    end

endmodule				