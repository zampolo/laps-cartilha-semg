name-of-the-file = cartilha-laps-semg

$(name-of-the-file).pdf: $(name-of-the-file).ps
	ps2pdf $(name-of-the-file).ps

$(name-of-the-file).ps: $(name-of-the-file).dvi
	dvips $(name-of-the-file).dvi

$(name-of-the-file).dvi: $(name-of-the-file).tex 
	latex $(name-of-the-file).tex
	biber $(name-of-the-file)
	latex $(name-of-the-file).tex
	latex $(name-of-the-file).tex

view:
	evince $(name-of-the-file).pdf &

clean:
	rm *.bbl *.bcf *.blg *.xml *.aux *.dvi *.log *.ps *.toc *.bm
