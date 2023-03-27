# Use Bash shell expansion
SHELL=/bin/bash
#The program that you use for viewing pdf files
PDFVIEWER = zathura
# Change name of this if you change the name of demo_student_thesis.tex, should be name of the main tex file
TEXMAINFILE = edvth289_master_thesis.tex
# Name that you would like for your resulting pdf file, without extension.
# Defaults to $(TEXMAINFILE) with .pdf as extension
PDFNAME = $(shell basename -s.tex $(TEXMAINFILE))
#Location of latexmk binary
MKLATEX = latexmk
#Options to latexmk, should need to be changed
MKLATEXOPTS = -pdf -pdflatex="xelatex -interaction=nonstopmode" -use-make

all: $(PDFNAME).pdf

$(PDFNAME).pdf: $(TEXMAINFILE) *.tex $(PDFNAME).bib
	$(MKLATEX) $(MKLATEXOPTS) $<

%.bib: references.bib
	cp $< $@

view: $(PDFNAME).pdf
	$(PDFVIEWER) $(PDFNAME).pdf &

watch:
	while true; do make --silent; sleep 2; done

clean:
	$(MKLATEX) -CA
	rm -f $(PDFNAME).pdf *.{aux,bbl,bcf,blg,cb,fdb_latexmk,fls,lof,log,lot,out,run.xml,rel,synctex.gz,toc}
