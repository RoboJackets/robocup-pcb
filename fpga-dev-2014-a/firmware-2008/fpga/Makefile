# vi:noet:ts=8

# Base name of the project file.
PROJECT=robocup

# Part name
PART=xc3s100etq144

# Implementation option file
# Pick one: fast_runtime balanced high_effort overnight weekend exhaustive
IMPLEMENT=fast_runtime

# Synthesis option file
SYNTH=xst_mixed

# Working directory name
WORK=work

# PROM size in KB
PROM_SIZE=128

WORK_DIR:=$(PWD)/work
JTAG_DIR=../jtag

SRCS=bldc.v half_bridge.v kicker.v hall_counter.v motor.v pwm.v encoder.v top.v

.PHONY: all clean sim project prog prog_only
.PHONY: $(PROJECT).prj

all:	$(WORK_DIR)/$(PROJECT).bit

$(WORK_DIR)/$(PROJECT).bit:	$(SRCS) $(PROJECT).ucf
	rm -rf $(WORK)/
	rm -f *.vcd *.sim
	mkdir -p $(WORK)
	ln -s ../robocup.ucf $(WORK)/
	xflow -wd $(WORK) -p $(PART) -synth $(SYNTH) -implement $(IMPLEMENT) -config bitgen $(PROJECT)

clean:
	rm -rf $(WORK)/
	rm -f *.vcd *.sim

sim:	sim_top.graph

prog: all prog_only

prog_only:
	@cd $(JTAG_DIR); ./xilinx $(WORK_DIR)/$(PROJECT).bit

prog_spi:	$(WORK)/$(PROJECT).bin
	@cd $(JTAG_DIR); ./spi -w $(WORK_DIR)/$(PROJECT).bin

$(PROJECT).prj:
	@rm -f $(PROJECT).prj
	@for i in $(SRCS); do echo "verilog work $$i" >> $(PROJECT).prj; done

%.bin:	%.bit
	promgen -spi -p bin -o $@ -s $(PROM_SIZE) -u 0 $<

%.sim:	%.v
	iverilog $< -o $@

%.vcd:	%.sim
	./$<
	mv -f dump.vcd $@

%.graph:	%.vcd
	gtkwave $< $(addsuffix .sav, $(basename $<))

