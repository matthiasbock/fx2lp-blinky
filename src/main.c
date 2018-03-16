
#include <fx2regs.h>
#include <delay.h>


void main()
{
	// Configure pins PA0 and PA1 as outputs
	OEA = (1 << 0) | (1 << 1);

	// Forever blinky
	while (1)
	{
		// Enable LEDs on PA0 and PA1
		PA0 = 0;
		PA1 = 0;

		// Wait a second
		delay(1000);

		// Disable LEDs on PA0 and PA1
		PA0 = 1;
		PA1 = 1;

		// Wait a second
		delay(1000);
	}
}
