MAIN = main

.PHONY: FORCE_MAKE

all: $(MAIN).pdf

$(MAIN).pdf: FORCE_MAKE
	latexmk $(MAIN)

view: FORCE_MAKE
	latexmk -pv $(MAIN)

edit:
	latexmk -pvc $(MAIN)

clean:
	latexmk -c $(MAIN)
