module Test_bench;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [2:0] NS;
	wire [2:0] EW;

	// Instantiate the Unit Under Test (UUT)
	traffic_light_controller uut (
		.clk(clk), 
		.reset(reset), 
		.NS(NS), 
		.EW(EW)
	);
	
	// Clock generation: 100 MHz => 10ns period
    always #5 clk = ~clk;

    // Human-readable decoder for light outputs
    function [15*8-1:0] decode_light;
        input [2:0] light;
        begin
            case (light)
                3'b100: decode_light = "RED      ";
                3'b010: decode_light = "YELLOW   ";
                3'b001: decode_light = "GREEN    ";
                default: decode_light = "UNKNOWN  ";
            endcase
        end
    endfunction

	initial begin
		 $display("Time(ns)\tReset\tNS Light\tEW Light");

        // Initialize inputs
        clk = 0;
        reset = 1;

        // Hold reset high for 20ns (2 clock cycles)
        #20;
        reset = 0;

        // Run simulation for 1000ns (~100 cycles)
        #1000;

        // Apply reset in middle of operation (optional test)
        reset = 1;
        #20;
        reset = 0;

        // Continue simulation to verify reset behavior
        #1000;

        $finish;
    end
	 
    // Monitor outputs
    always @(posedge clk) begin
        $display("%8t\t%b\t%s\t%s", $time, reset, decode_light(NS), decode_light(EW));
    end
      
endmodule
