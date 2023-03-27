all: affine-and-interval-arithmatic.pdf thesis.pdf

.PHONY: all

%.pdf: %.md
	pandoc -fmarkdown $< -tpdf -o $@

%.pdf: %.tex %.bib abstract.tex 
	tectonic --keep-intermediates --reruns 0 $(shell basename --suffix=".tex" $<).tex
	biber $(shell basename --suffix=".tex" $<)
	tectonic $(shell basename --suffix=".tex" $<).tex --outfmt pdf

clean:
	rm *.aux
	rm *.bbl
	rm *.bcf
	rm *.pdf
