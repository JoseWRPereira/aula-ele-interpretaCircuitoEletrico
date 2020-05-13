
# pdflatex -synctex=1 -shell-escape -enable-write18 -interaction=nonstopmode %.tex
# bibtex %.aux
# makeindex %.idx
# makeglossaries %

ARTIGO=Aula
PDF_PATH=./pdf/
FIG_PATH=./fig/

LATEX=pdflatex

FIGS += \
fig-circuitoDesafio.aux \
fig-circuitoDesafioFonteCarga.aux \
fig-circuitoSimples.aux \
fig-circuitoDesafioNoSup.aux \
fig-circuitoDesafioNoInf.aux \
fig-circuitoDesafioRamoRLED.aux \
fig-circuitoDesafioRamoRL.aux \
fig-circuitoDesafioRamoFonte.aux \
fig-circuitoExemplo.aux \
fig-ativ1.aux \
fig-ativ2.aux \
fig-ativ3.aux \
fig-ativ4.aux


artigo: CLR
	evince $(PDF_PATH)$(ARTIGO).pdf&

CLR: MOV clear

MOV: LATEX1
	mv -f *.pdf $(PDF_PATH)

LATEX1: LATEX0
	$(LATEX) -synctex=1 -shell-escape -enable-write18 -interaction=nonstopmode $(ARTIGO)

LATEX0: $(ARTIGO).tex $(FIGS)
	$(LATEX) $(ARTIGO)

%.aux: %.tex
	$(LATEX) $<
	mv fig*.pdf $(FIG_PATH)



#PDFLATEX: LATEX1
#	pdflatex -synctex=1 -shell-escape -enable-write18 -interaction=nonstopmode $(ARTIGO)

#LATEX1: NOMENCLATURA BIB
#	pdflatex $(ARTIGO)

#BIB: LATEX0
#	bibtex $(ARTIGO)

#NOMENCLATURA: LATEX0 cap.nlo
#	makeindex $(ARTIGO)).nlo -s nomencl.ist -o $(ARTIGO)).nls




clean:
clear:
	rm -f *.aux
	rm -f *.bbl
	rm -f *.bcf
	rm -f *.blg
	rm -f *.ilg
	rm -f *.lof
	rm -f *.log
	rm -f *.lot
	rm -f *.nav
	rm -f *.nlo
	rm -f *.nls
	rm -f *.out
	rm -f *.pdf
	rm -f *.run.xm
	rm -f *.run.xml
	rm -f *.toc
	rm -f *.synctex.gz
	rm -f *.snm
	rm -f *~
