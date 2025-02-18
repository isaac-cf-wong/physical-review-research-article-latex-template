# Makefile for compiling PRD article

filename = main.tex
bibname = reference.bib

TEXFILES = *tex
BBLFILES = *bbl
PDFFILES = *pdf
BSTFILES = *bst

LATEXMK=latexmk

all: main.pdf

main.pdf: ${filename} ${bibname}
	$(LATEXMK) ${filename}

gitID.txt:
	git describe --abbrev=8 --dirty --always --tags > gitID.txt

clean:
	rm -f *.pdf *.aux *.bbl *.blg *.log *.toc *.out *.fdb* *.fls gitID.txt

arxiv.tar: $(PDFFILES) $(TEXFILES) $(BBLFILES) $(BSTFILES)
	tar chvf arxiv.tar $(TEXFILES) $(BBLFILES) $(BSTFILES) $$(grep includegraphic *tex | egrep -o '\{.*\}' | sed 's/{//' | sed 's/}//' | sed 's|^|figures/|')
