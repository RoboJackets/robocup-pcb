TARGET=base_station
OBJS=base_station.o radio.o device.o host.o
DEVICE=at90usb647

AS=avr-as
CC=avr-gcc
OBJCOPY=avr-objcopy
CFLAGS=-Os -Wall -mmcu=$(DEVICE) -std=c99
LDFLAGS=-mmcu=$(DEVICE)
ISPFLAGS=-c stk500v2 -P /dev/ttyS1 -p $(DEVICE) 

all:		$(TARGET).hex

clean:
		rm -f $(TARGET).hex $(TARGET).elf $(OBJS)

prog:		$(TARGET).hex
		dfu-programmer $(DEVICE) erase
		dfu-programmer $(DEVICE) flash --suppress-validation $<
		dfu-programmer $(DEVICE) reset

# This looks convoluted, making the elf and then the hex.
# But if ld generates a hex, it will include bss, which will overwrite text
# (because hex files don't have sections), causing weird bugs.  objcopy
# creates a hex file suitable for programming.

$(TARGET).elf:	$(OBJS)
		$(CC) $(LDFLAGS) $(OBJS) -o $(TARGET).elf

$(TARGET).hex:	$(TARGET).elf
		$(OBJCOPY) -O ihex $< $@

