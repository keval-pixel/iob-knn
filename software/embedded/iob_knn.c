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

void knn_init(int base_address){
  //capture base address for good
  base=base_address;
  knn_reset();
  knn_start();
}


<<<<<<< HEAD
unsigned int distance(short x1, short x2, short y1, short y2){

  unsigned int dist;

  IO_SET(base, KNN_X1, (short)x1);
  IO_SET(base, KNN_X2, (short)x2);
  IO_SET(base, KNN_Y1, (short)y1);
  IO_SET(base, KNN_Y2, (short)y2);
  dist = (unsigned int)IO_GET(base, KNN_VALUE);;
  
=======
unsigned long long distance(int x1, int x2, int y1, int y2){

  unsigned long long dist;
  unsigned int dist_low, dist_high;
  
  IO_SET(base, KNN_X1, x1);
  IO_SET(base, KNN_X2, x2);
  IO_SET(base, KNN_Y1, y1);
  IO_SET(base, KNN_Y2, y2);

  dist_high = (unsigned int) IO_GET(base, KNN_VALUE_HIGH);
  dist_low = (unsigned int) IO_GET(base, KNN_VALUE_LOW);
  dist = dist_high;
  dist <<= 32;
  dist |= dist_low;

  printf("distance within function is %ld\n", dist); 

>>>>>>> a877c3779eccbcf1c619e40f182b529488e6d7dd
  return dist;
}
