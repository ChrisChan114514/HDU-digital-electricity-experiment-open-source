#define GPIO_ADDR  0x00031000
#define UART_ADDR  0x00030000
#define VIDEO_ADDR 0x00020000
#define CLK_FREQ   5000000 //时钟不准的话，这里调整
//标准 5000000
volatile unsigned int show = 0x00000000;
volatile int time = CLK_FREQ;
volatile unsigned int second_low = 0x00000000;
volatile unsigned int second_high = 0x00000000;
volatile unsigned int min_low = 0x00000000;
volatile unsigned int min_high = 0x00000000;
volatile unsigned int hour_low = 0x00000002; // 初始化为12
volatile unsigned int hour_high = 0x00000001; // 初始化为12

int main(void) {

	hour_low = 0x00000002;
	hour_high = 0x00000001;
    while(1) {
        while(time--);
        time = CLK_FREQ;
        show = (second_low << 28) | (second_high << 24) | (min_low << 20) | (min_high << 16) | (hour_low << 12) | (hour_high << 8);
        *(volatile unsigned int*) (GPIO_ADDR)  = show;
        //*(volatile unsigned char*)(UART_ADDR)  = 'H';
		if (hour_high>=0x00000002 && hour_low>=0x00000004 )
		{
			hour_high = 0x00000000;
			hour_low = 0x00000000;
			min_high = 0x00000000;
			min_low = 0x00000000;
			second_high = 0x00000000;
			second_low = 0x00000000;
		}
        if (second_low == 0x00000009)
		 {
            second_low = 0x00000000;
            if (second_high == 0x00000005) 
			{
                second_high = 0x00000000;
                if (min_low == 0x00000009) 
				{
                    min_low = 0x00000000;
                    if (min_high == 0x00000005) 
					{
                        min_high = 0x00000000;
                        if (hour_low == 0x00000009) 
						{

                            hour_low = 0x00000000;
							hour_high++;
                            
                        } 
						else 
						{
                            hour_low++;
                        }
                    } 
					else 
					{
                        min_high++;
                    }
                } 
				else 
				{
                    min_low++;
                }
            } 
			else
			{
                second_high++;
            }
        } 
		else 
		{
            second_low++;
        }
    }


}