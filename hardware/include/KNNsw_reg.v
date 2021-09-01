//START_TABLE sw_reg
`SWREG_W(KNN_RESET,          1, 0) //Timer soft reset
`SWREG_W(KNN_ENABLE,         1, 0) //Timer enable
`SWREG_W(KNN_X1,         DATA_W, 0) //X1 coordinate
`SWREG_W(KNN_X2,         DATA_W, 0) //X2 coordinate
`SWREG_W(KNN_Y1,         DATA_W, 0) //Y1 coordinate
`SWREG_W(KNN_Y2,         DATA_W, 0) //Y2 coordinate
`SWREG_R(KNN_VALUE_HIGH, DATA_W, 0) //MSB of the KNN_VALUE
`SWREG_R(KNN_VALUE_LOW,  DATA_W, 0) //LSB of the KNN_VALUE
