#pragma once

//Functions
void knn_reset();
void knn_start();	
void knn_stop();
int knn_init(int base_address);	
//unsigned int distance (short x2, short y2);
unsigned int distance(short x1, short x2, short y1, short y2);
