
//////////////////////////////////////////////////////////////////////////////////
// University : Faculty of Engineeering Electical and information Department University of Ruhuna Sri Lanka
// Engineer: Undergraduate Electrical and Information Engineer W.A.P.N FERNANDO
// 
// Create Date: 06/07/2025 02:18:40 AM
// Design Name: 
// Module Name: and_gate
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


module and_gate(
    input  input_1, input_2,    
    output and_result
    );
    
    wire and_temp;
    
    assign and_temp = input_1 & input_2;
    
    assign and_result = and_temp;
endmodule
