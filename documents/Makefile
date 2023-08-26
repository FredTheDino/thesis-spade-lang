all: affine-and-interval-arithmatic.pdf thesis.pdf

.PHONY: all

%.pdf: %.md
	pandoc -fmarkdown $< -tpdf -o $@

%.pdf: %.tex %.bib abstract.tex appendix_version_and_hashes.tex background.tex conclusion.tex discussion.tex introduction.tex method.tex results.tex acknowledgments.tex
	tectonic --keep-intermediates -Z shell-escape --outfmt pdf $<


watch:
	watch -n 10 make thesis.pdf


clean:
	rm *.aux
	rm *.bbl
	rm *.bcf
	rm *.pdf
