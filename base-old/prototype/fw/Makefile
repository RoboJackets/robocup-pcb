TARGET=base_station
OBJS=base_station.o radio.o
DEVICE=at90usb82

AS=avr-as
CC=avr-gcc
OBJCOPY=avr-objcopy
CFLAGS=-Os -Wall -mmcu=$(DEVICE) -std=c99
LDFLAGS=-mmcu=$(DEVICE)

FLIPDIR=$(HOME)/ext/flip.3.2.1/bin
FLIP_BATCH=$(FLIPDIR)/batchisp3.sh

all:		$(TARGET).hex

clean:
		rm -f $(TARGET).hex $(TARGET).elf $(OBJS) cc1101.h

reset:
		dfu-programmer $(DEVICE) reset

prog: prog_dfu

prog_flip:	$(TARGET).hex
		sudo $(FLIP_BATCH) -hardware usb -device $(DEVICE) -operation loadbuffer $(abspath $<) erase f program verify start reset 0

prog_dfu:	$(TARGET).hex
		dfu-programmer $(DEVICE) erase
		dfu-programmer $(DEVICE) flash --suppress-validation $<
		dfu-programmer $(DEVICE) reset

$(TARGET).elf:	$(OBJS)
		$(CC) $(LDFLAGS) $(OBJS) -o $(TARGET).elf

$(TARGET).hex:	$(TARGET).elf
		$(OBJCOPY) -O ihex $< $@

#radio.o: cc1101.h

#cc1101.h:	cc1101.prs make_regs
#		./make_regs $< > $@
