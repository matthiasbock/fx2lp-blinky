
#include <fx2regs.h>
#include <delay.h>


void main()
{
	OEA = 0x3;
	while (1)
	{
		IOA = 0;
		delay(1000);
		IOA = 0x3;
		delay(1000);
	}
}
