
#include <fx2regs.h>
#include <delay.h>


void main()
{
	while (1)
	{
		IOA |= PA0;
		delay(1000);
		IOA &= ~PA0;
		delay(1000);
	}
}
