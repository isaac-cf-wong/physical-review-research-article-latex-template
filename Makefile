# Makefile for compiling PRD article

filename = main

SRC_DIR = .
CLEANED_DIR = $(shell realpath $(SRC_DIR))_arXiv

TEXFILES = *tex
BBLFILES = *bbl
PDFFILES = *pdf
BSTFILES = *bst
FIGURES = $$(grep includegraphic *tex | egrep -o '\{.*\}' | sed 's/{//' | sed 's/}//' | sed 's|^|figures/|')

LATEXMK=latexmk

all: main.pdf

bib:
	adstex main.tex -o references.bib

main.pdf: bib
	$(LATEXMK) -pdf ${filename}

gitID.txt:
	@echo "Recording Git commit ID..."
	git describe --abbrev=8 --dirty --always --tags > gitID.txt

clean:
	@echo "Cleaning auxiliary and output files..."
	rm -f *.pdf *.aux *.bbl *.blg *.log *.toc *.out *.fdb* *.fls gitID.txt

clean_arxiv: main.pdf
	@echo "Cleaning LaTeX source for arXiv submission..."
	arxiv_latex_cleaner $(SRC_DIR)
