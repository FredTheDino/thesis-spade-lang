all: affine-and-interval-arithmatic.pdf thesis.pdf

.PHONY: all

%.pdf: %.md
	pandoc -fmarkdown $< -tpdf -o $@

%.pdf: %.tex %.bib abstract.tex 
	tectonic --keep-intermediates --reruns 0 $<
	biber $(shell basename --suffix=".tex" $<)
	tectonic $< --outfmt pdf

clean:
	rm *.aux
	rm *.bbl
	rm *.bcf
	rm *.pdf
