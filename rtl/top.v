`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2022 12:56:29
// Design Name: 
// Module Name: top
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

module top(
  input clk_rec,
  input clk_send,
  input resetn_rec,
  input resetn_send,
  
  input [7:0]  data_i,
  input        valid_i,
  
  output [7:0] data_o,
  output       valid_o
);
  
wire valid_in_rec;
wire [7:0] data_in_rec;
assign valid_in_rec = valid_i;

dom_data dom_data(
  .clk_i         ( clk_send     ),
  .resetn_i      ( resetn_send  ),
  .data_i        ( data_i       ),

  .valid_send_o  ( valid        ),
  .valid_send_i  ( valid_in_rec ),
  .data_o        ( data_in_rec  )
);

dom_data_reception dom_data_reception (
  .clk_i          ( clk_rec       ),
  .resetn_i       ( resetn_rec    ),

  .data_rec_o     ( data_o        ),
  .valid_i        ( valid         ),
  .data_i         ( data_in_rec   ),
  .valid_rec_o    ( valid_o       )
);


endmodule

