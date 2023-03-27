all: affine-and-interval-arithmatic.pdf thesis.pdf

.PHONY: all

%.pdf: %.md
	pandoc -fmarkdown $< -tpdf -o $@

%.pdf: % %.tex %.bib
	tectonic --keep-intermediates --reruns 0 $<.tex
	biber $<
	tectonic $<.tex --outfmt pdf

clean:
	rm *.aux
	rm *.bbl
	rm *.bcf
	rm *.pdf
