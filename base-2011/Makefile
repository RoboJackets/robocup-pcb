PCB=base
SCHS=base.sch radio.sch

.PHONY: all clean

all:	$(PCB).pcb $(PCB).csv

clean:
	rm -f $(PCB).net $(PCB).pcb.* $(PCB).cmd
	rm -f *~ *.log

$(PCB).pcb:	$(SCHS)
	gsch2pcb -d footprints -o $(PCB) $(SCHS)

$(PCB).csv:	$(SCHS)
	gnetlist -g bom2 -o $@ $^

renum:	$(SCHS)
	refdes_renum $^

drc:	$(SCHS)
	gnetlist -g drc2 -o $@ $^
	cat drc
