`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2022 12:30:22
// Design Name: 
// Module Name: dom_data
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


module dom_data(
  input               clk_i,
  input               resetn_i,

  input       [7:0]   data_i,
  input               valid_send_i,
  
  output reg     [7:0]   data_o,
  output reg          valid_send_o
);

reg [7:0] data;
reg [5:0] counter;

//assign data_o = data_i;

always @(posedge clk_i or negedge resetn_i) begin
  if ( !resetn_i ) begin
    //data    <= 8'd0;
    valid_send_o <= 1'd0;
    counter      <= 'd0;
    data_o       <= 'd0;
  end
  else begin
  /*
    if(valid_send_i || valid_send_o) begin
     if (counter == 'd0) begin   // valid up on 3 clocks
       counter <= counter + 'd1;
       data_o <= data_i;
       valid_send_o <= 'd1;
     end
     else if (counter == 'd3) begin
       counter <= 'd0;
       valid_send_o <= 'd0;
     end
     else counter <= counter + 'd1;
    end
    */
    
    if( valid_send_i ) begin
      valid_send_o <= 'd1;
      data_o       <= data_i;
    end
    else valid_send_o <= 'd0;
  end
end

endmodule
