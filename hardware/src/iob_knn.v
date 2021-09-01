`timescale 1ns/1ps
`include "iob_lib.vh"
`include "interconnect.vh"
`include "iob_knn.vh"

module iob_knn 
  #(
    parameter ADDR_W = `KNN_ADDR_W, //NODOC Address width
    parameter DATA_W = `DATA_W, //NODOC Data word width
    parameter WDATA_W = `KNN_WDATA_W //NODOC Data word width on writes
    )
   (
`include "cpu_nat_s_if.v"
`include "gen_if.v"
    );

//BLOCK Register File & Configuration, control and status registers accessible by the sofware
`include "KNNsw_reg.v"
`include "KNNsw_reg_gen.v"

    //combined hard/soft reset 
   `SIGNAL(rst_int, 1)
   `COMB rst_int = rst | KNN_RESET;

   //write signal
   `SIGNAL(write, 1) 
   `COMB write = | wstrb;

   //
   //BLOCK 64-bit time counter & Free-running 64-bit counter with enable and soft reset capabilities
   //
   `SIGNAL_OUT(KNN_VALUE, 2*DATA_W)
   knn_core knn0
     (
      .KNN_ENABLE(KNN_ENABLE),
      .KNN_X1(KNN_X1),
      .KNN_X2(KNN_X2),
      .KNN_Y1(KNN_Y1),
      .KNN_Y2(KNN_Y2),
      .KNN_VALUE(KNN_VALUE),
      .clk(clk),
      .rst(rst_int)
      );

    assign  KNN_VALUE_LOW = KNN_VALUE[DATA_W-1:0];
    assign  KNN_VALUE_HIGH = KNN_VALUE[2*DATA_W-1:DATA_W];
   
   //ready signal   
   `REG_AR(clk, rst, 0, ready_int, valid)

   `SIGNAL2OUT(ready, ready_int)

   //rdata signal
   //`COMB begin
   //end
      
endmodule

