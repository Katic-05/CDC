module dom_data_reception(
  input clk_i,
  input resetn_i,
  
  input valid_i,
  input [7:0] data_i,

  output  reg [7:0]  data_rec_o,
  output reg        valid_rec_o
  
  );

  reg [7:0] data_buff;
  reg [3:0] count;

  always @(posedge clk_i  or negedge resetn_i) begin
    if(!resetn_i) begin
      //busy_o      <= 'd0;
      data_rec_o  <= 'd0;
      data_buff   <= 'd0;
      valid_rec_o <= 'd0;
      count       <= 'd0;
    end else  begin
    /*
      if( valid_i && !busy_o ) begin
        //data_buff <= data;
        //data_rec <= data_i;
        busy_o    <= 1'd1;
      end
      else if( data_i == data_rec ) busy_o <= 1'd0;
      else data_rec <= data_i;
      */
      if ( valid_i ) begin 
        data_rec_o  <= data_i;
        //data_buff   <= data_i;
        count       <= count + 'd1;
        valid_rec_o <= 'd1;
      end
      else valid_rec_o <= 'd0;
      //data_rec_o  <= data_buff;
    end
  end 
endmodule