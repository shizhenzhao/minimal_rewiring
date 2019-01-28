TEXSRC = dcn_striping.tex
BIBSRC = zsz.bib
FIGS = 

ALLSRC = $(TEXSRC) $(BIBSRC) $(FIGS) 

all: dcn_striping.pdf

dcn_striping.pdf: dcn_striping.ps
	ps2pdf14 dcn_striping.ps

dcn_striping.ps: dcn_striping.dvi
	dvips -t letter -e 0 -o dcn_striping.ps dcn_striping.dvi

dcn_striping.dvi: $(ALLSRC) dcn_striping.bbl
	pdflatex dcn_striping
	pdflatex dcn_striping

dcn_striping.aux: $(ALLSRC)
	latex dcn_striping

dcn_striping.bbl: $(ALLSRC) dcn_striping.aux
	bibtex dcn_striping

clean:	
	rm -f dcn_striping.aux dcn_striping.log dcn_striping.bbl


