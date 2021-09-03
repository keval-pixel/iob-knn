//START_TABLE sw_reg
`SWREG_W(KNN_RESET,          1, 0) //KNN soft reset
`SWREG_W(KNN_ENABLE,         1, 0) //KNN enable
`SWREG_W(KNN_X1,         DATA_W/2, 0) //X1 coordinate
`SWREG_W(KNN_X2,         DATA_W/2, 0) //X2 coordinate
`SWREG_W(KNN_Y1,         DATA_W/2, 0) //Y1 coordinate
`SWREG_W(KNN_Y2,         DATA_W/2, 0) //Y2 coordinate
`SWREG_R(KNN_VALUE, DATA_W, 0) // KNN_VALUE
