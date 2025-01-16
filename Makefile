TARGETS = cv.pdf
LATEXMK = latexmk
LATEXMKOPTS = -pdf -cd -recorder -use-make -pdflatex="pdflatex -interaction=nonstopmode %O %S"

.PHONY: all clean FORCE_MAKE

all: $(TARGETS)

%.pdf: %.tex FORCE_MAKE
	$(LATEXMK) $(LATEXMKOPTS) $<

clean:
	$(LATEXMK) -C
	rm -f $(TARGETS)
	rm -f *.bbl *.blg *.aux *.log *.out *.fls *.fdb_latexmk *.xmpi *.xmpdata
