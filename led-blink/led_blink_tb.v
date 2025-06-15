`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2025 12:05:19 PM
// Design Name: 
// Module Name: led_blink_tb
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


module led_blink_tb();

    reg i_clock = 0, i_enable, i_switch_1, i_switch_2;
    wire o_led_drive;
    
    led_blink dut( .i_clock(i_clock), 
                   .i_enable(i_enable),
                   .i_switch_1(i_switch_1),
                   .i_switch_2(i_switch_2),
                   .o_led_drive(o_led_drive)
                   );
   initial begin
        forever #20 i_clock <= ~i_clock;
   end
   
   initial begin
        $dumpfile("dump.vcd");  // Create a vcd file
        $dumpvars(0, dut);      // Dump all variables
        
        i_enable <= 1'b1;
        
        i_switch_1 <= 1'b0;
        i_switch_2 <= 1'b0;
        #20000 // 0.2 seconds
        
        i_switch_1 <= 1'b0;
        i_switch_2 <= 1'b1;
        #20000 // 0.2 seconds

        i_switch_1 <= 1'b1;
        i_switch_2 <= 1'b0;
        #20000 // 0.2 seconds
        
        i_switch_1 <= 1'b1;
        i_switch_2 <= 1'b1;
        #20000 // 0.2 seconds
        
        $display("Test Complete");
        $finish();
   end

endmodule
