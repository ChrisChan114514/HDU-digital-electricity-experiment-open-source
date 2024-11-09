#主要功能
二选一同步DFF
input: CLK,ENA(ENA=1，DFFE工作，否则输出0不工作)，LOAD(数据选择)，D(数据1)，SI(数据2)
output:Q
#硬件仿真
##引脚与用法
ENA--SW4 (ENA=1,DFFE工作；否则输出0不工作)
LOAD--SW3 (LOAD==1,选SW1的信号；LOAD==0,选SW2的信号)
KEY3--CLK (上升沿，Q<=D)
SW1--SI (DATA_IN 1)
SW2--D (DATA_IN 2)
#注意！
SW1/SW2/SW3/SW4上拨保持高电平，下拨低电平；KEY1/2/3按下低电平，不按高电平；LED1/2/3/4共阴极，即LED灯亮，对应引脚高电平。

