`timescale 1ns/1ps
`include "iob_lib.vh"
`include "KNNsw_reg.vh"

module knn_core
  #(
    parameter DATA_W = 32
    )
   (
    `INPUT(KNN_ENABLE, 1),
    `INPUT(KNN_X1, DATA_W/2),
    `INPUT(KNN_X2, DATA_W/2),
    `INPUT(KNN_Y1, DATA_W/2),
    `INPUT(KNN_Y2, DATA_W/2),
    `OUTPUT(KNN_VALUE, DATA_W),
    `INPUT(clk, 1),
    `INPUT(rst, 1)
    );

   //difference between coordinates
   `SIGNAL_SIGNED(difx, DATA_W/2)
   `SIGNAL_SIGNED(dify, DATA_W/2)
 
   `SIGNAL_SIGNED(squarex, DATA_W)
   `SIGNAL_SIGNED(squarey, DATA_W)

   `SIGNAL(distance, DATA_W)
   
   `COMB begin
      
      difx <= KNN_X1-KNN_X2;
      dify <= KNN_Y1-KNN_Y2;
      squarex <= difx*difx;
      squarey <= dify*dify;
      
   end
   
   `REG(clk, distance, squarex+squarey)
   
   `SIGNAL2OUT(KNN_VALUE, distance) 
         
endmodule

