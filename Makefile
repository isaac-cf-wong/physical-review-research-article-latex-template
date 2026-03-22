# Makefile for compiling PRD article

filename = main

TEXFILES = *tex
BBLFILES = *bbl
PDFFILES = *pdf
BSTFILES = *bst
FIGURES = $$(grep includegraphic *tex | egrep -o '\{.*\}' | sed 's/{//' | sed 's/}//' | sed 's|^|figures/|')

LATEXMK=latexmk

all: main.pdf

main.pdf:
	$(LATEXMK) -pdf ${filename}

gitID.txt:
	@echo "Recording Git commit ID..."
	git describe --abbrev=8 --dirty --always --tags > gitID.txt

clean:
	@echo "Cleaning auxiliary and output files..."
	rm -f *.pdf *.aux *.bbl *.blg *.log *.toc *.out *.fdb* *.fls gitID.txt
