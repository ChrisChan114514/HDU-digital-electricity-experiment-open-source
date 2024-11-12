

#74HC595功能

74HC595的最重要的功能就是：串行输入，并行输出。

其次，74HC595里面有2个8位寄存器：**移位寄存器、存储寄存器**。

74HC595的数据来源只有一个口，一次只能输入一个位，那么连续输入8次，就可以积攒为一个字节了。

# 主控芯片引脚：74HC595
## 输入引脚
RCLK--**存储寄存器的CLK**,上升沿时数据从移位寄存器转存到存储寄存器
SRCLK--**移位寄存器时钟引脚**，上升沿时，移位寄存器中的bit 数据整体后移，并接受新的bit（从SER输入）
SER--**串行一位输入**
SRCLRN--低电平有效，**清空移位寄存器中已有的bit数据**
GN--GN==1，输出寄存器全部输出高阻态（Z）;GN==0，输出寄存器工作
	
## 输出引脚
QA~QH:**输出寄存器 输出位**
QHN: 移位寄存器 最高位输出

此实验无硬件验证

