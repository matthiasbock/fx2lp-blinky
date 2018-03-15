
AS = sdas8051
CC = sdcc
LD = sdcc

SDCCLIB = SDCClib
OBJCOPY = objcopy


MAIN = main
FX2LIB = lib/fx2lib

SRCS := $(wildcard src/*.c)
SRCS += $(wildcard $(FX2LIB)/lib/*.c)
SRCS := $(filter-out $(FX2LIB)/lib/setupdat.c,$(SRCS))
SRCS += $(wildcard $(FX2LIB)/lib/interrupts/*.c)
OBJS = $(SRCS:.c=.rel)

CFLAGS += -mmcs51
CFLAGS += -I$(FX2LIB)/include

LDFLAGS += -mmcs51
LDFLAGS += --code-size 0x1c00
LDFLAGS += --xram-size 0x0200
LDFLAGS += --xram-loc 0x1c00
#LDFLAGS += -Wl"-b DSCR_AREA=0x1e00"
#LDFLAGS += -Wl"-b INT2JT=0x1f00"


all: main.hex

%.rel: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

%.elf: $(OBJS)
	$(LD) $(LDFLAGS) $^ -o $@

%.hex: %.elf
	$(OBJCOPY) $< -Oihex $@

flash: $(MAIN).hex
	fxload -I $<

clean:
	#rm -f $(MAIN).elf $(MAIN).hex *.o src/*.o
