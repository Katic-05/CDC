`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2022 13:19:06
// Design Name: 
// Module Name: tb_top
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


module tb_top( );

// Clock period
localparam real CLK_PERIOD = 10;

logic clk_send, clk_rec, resetn, resetn_rec, resetn_send;

logic [7:0] data = 0, data_out;
logic valid = 0, valid_out;

logic result;

initial clk_send <= 0;
always #1ns clk_send <= ~clk_send;

initial clk_rec <= 0;
always #1.1ns clk_rec <= ~clk_rec;

assign resetn_rec = resetn;
assign resetn_send = resetn;

top top(
  .clk_rec (clk_rec ),
  .clk_send (clk_send),
  .resetn_rec(resetn_rec),
  .resetn_send(resetn_send),
  
  .data_i (data),
  .valid_i (valid),
  .data_o (data_out),
  .valid_o (valid_out)
);
task set_data;
forever begin
  @(posedge clk_rec)
  if(!valid) begin
    #200;
    valid <= 'd1;
    data <= data + 'd1;
  end

end

endtask

task check_data;
  forever begin
    @(posedge clk_rec)
      if (valid_out) begin  
        if(data  != data_out) begin
          result = 'd1;
          $stop;
        end
        else result = 'd0;
        valid <= 'd0;
      end

  end
endtask

initial begin
  resetn = 'd1;
  #5;
  resetn = 'd0;
  #5;
  resetn = 'd1;
  
  fork begin
    set_data();
  end
  begin
    check_data();
  end
  join
    
  end
  


endmodule
