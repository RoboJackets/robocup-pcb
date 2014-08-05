SVGS=robot.svg base.svg

.PHONY: all clean

all:	$(SVGS)

clean:
	rm -f $(SVGS)

%.svg:	%.txt
	dot -Tsvg $< -o$@

