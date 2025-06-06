`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University : Faculty of Engineeering Electical and information Department University of Ruhuna Sri Lanka
// Engineer: Undergraduate Electrical and Information Engineer W.A.P.N FERNANDO
// 
// Create Date: 06/07/2025 02:29:51 AM
// Design Name: 
// Module Name: and_gate_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module and_gate_tb();

    reg  input_1, input_2;    
    wire and_result;
    
    and_gate dut(.input_1(input_1), .input_2(input_2), .and_result(and_result));
    
    initial begin
        
        $dumpfile("dump.vcd");  // Create a vcd file
        $dumpvars(0, dut);      // Dump all variables
        
            input_1 = 1'b0; input_2 = 1'b0;
        #10 input_1 = 1'b0; input_2 = 1'b1;
        #10 input_1 = 1'b1; input_2 = 1'b0;
        #10 input_1 = 1'b1; input_2 = 1'b1;
        #10;
        $finish();
    end
    
    initial begin 
        $monitor("input_1 = %b input_2 = %b , and_result = %b", input_1, input_2, and_result);
    end

endmodule
