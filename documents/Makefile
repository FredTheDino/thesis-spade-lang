all: affine-and-interval-arithmatic.pdf thesis.pdf

.PHONY: all

%.pdf: %.md
	pandoc -fmarkdown $< -tpdf -o $@

%.pdf: %.tex %.bib abstract.tex 
	tectonic --keep-intermediates --outfmt pdf --reruns 2 $<

clean:
	rm *.aux
	rm *.bbl
	rm *.bcf
	rm *.pdf
