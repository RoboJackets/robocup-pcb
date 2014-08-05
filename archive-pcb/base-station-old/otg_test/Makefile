TARGET=host
OBJS=host.o serial.o
DEVICE=at90usb1287

AS=avr-as
CC=avr-gcc
OBJCOPY=avr-objcopy
CFLAGS=-Os -Wall -mmcu=$(DEVICE)
LDFLAGS=-mmcu=$(DEVICE)
ISPFLAGS=-c stk500v2 -P /dev/ttyS1 -p $(DEVICE) 

all:		$(TARGET).hex

clean:
		rm -f $(TARGET).hex $(TARGET).elf $(OBJS)

prog:		$(TARGET).hex
		avrdude $(ISPFLAGS) -U $(TARGET).hex

#prog_config:
#		uisp $(ISPFLAGS) --erase --wr_fuse_h=0xd8 --wr_fuse_l=0x3f

# This looks convoluted, making the elf and then the hex.
# But if ld generates a hex, it will include bss, which will overwrite text
# (because hex files don't have sections), causing weird bugs.  objcopy
# creates a hex file suitable for programming.

$(TARGET).elf:	$(OBJS)
		$(CC) $(LDFLAGS) $(OBJS) -o $(TARGET).elf

$(TARGET).hex:	$(TARGET).elf
		$(OBJCOPY) -O ihex $< $@

