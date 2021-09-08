#include "interconnect.h"
#include "iob_knn.h"
#include "KNNsw_reg.h"
#include "printf.h"

//base address
static int base;

void knn_reset(){
  IO_SET(base, KNN_RESET, 1);
  IO_SET(base, KNN_RESET, 0);
}

void knn_start(){
  IO_SET(base, KNN_ENABLE, 1);
}

void knn_stop(){
  IO_SET(base, KNN_ENABLE, 0);
}

int knn_init(int base_address){
  //capture base address for good
  base=base_address;
  knn_reset();
  knn_start();
}

//unsigned int distance(short x2, short y2){
unsigned int distance(short x1, short x2, short y1, short y2){

  unsigned int dist;

  IO_SET(base, KNN_X1, (short)x1);
  IO_SET(base, KNN_Y1, (short)y1);
  IO_SET(base, KNN_X2, (short)x2);
  IO_SET(base, KNN_Y2, (short)y2);
  dist = (unsigned int)IO_GET(base, KNN_VALUE);
  
  return dist;
}
