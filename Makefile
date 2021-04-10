STYLE-PATH= ${HOME}/Library/texmf/tex/latex/
LANGSCI-PATH=~/Documents/Dienstlich/Projekte/LangSci/Git-HUB/latex/

SOURCE= germanisch-include.tex germanisch-slides.tex germanisch-handout.tex ${STYLE-PATH}hu-beamer-includes-pdflatex.sty\
	organisatorisches-germanisch-vl.tex \
	germanisch-ueberblick.tex \
	germanisch-deutsch.tex \
	germanisch-englisch.tex \
	germanisch-niederlaendisch.tex \
	germanisch-afrikaans.tex \
	germanischtax.tex

SOURCE2= organisatorisches-syntax-vl-ba-hu.tex\
	 germanisch-ueberblick.tex \
         germanisch-phaenomene.tex \
	germanisch-verbalkomplex.tex\
	germanisch-passiv.tex\
	germanisch-expletives.tex\
	germanisch-include.tex


#$(SOURCE2) 
%.pdf: %.tex $(SOURCE2) 
	xelatex $*
	biber $*
	xelatex $* 
	biber $*
	xelatex $* 


slides: germanisch-slides.pdf
handout: germanisch-handout.pdf

check: germanisch-check-2x2.pdf




einf-gt-aufgaben.dvi: einf-gt-aufgaben.tex
	latex $?


test-fromgram.2.pdf: test-germanisch.pdf
	beamer2handout $?

public: germanisch-slides.pdf germanisch-handout.pdf germanisch-handout-1up.pdf
	scp $? /home/stefan/public_html/PS/



# germanisch-handout-1up.pdf
o-public: germanisch-slides.pdf germanisch-handout.pdf germanisch-handout-ueberblick.pdf germanisch-handout-phaenomene.pdf germanisch-handout-valenz-scrambling.pdf
	scp -p $? hpsg.hu-berlin.de:/home/stefan/public_html/PS/





install:
	cp -p ${STYLE-PATH}Beamer/hu-beamer-includes-pdflatex.sty                                          styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/theme/beamerthemeHUBerlin.sty     styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/font/beamerfontthemehu.sty        styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/color/beamercolorthemebearHU.sty  styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/inner/beamerinnerthemehui.sty     styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/outer/beamerouterthemehuo.sty     styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/beamer-movement.sty                                                      styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/forest-beamer-setup.sty                                                  styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/hu-literatur-biber.tex                                                   styles/Beamer/
	cp -p ${STYLE-PATH}makros.2e.sty styles/
	cp -p ${STYLE-PATH}abbrev.sty    styles/
	cp -p ${STYLE-PATH}fixcitep.sty  styles/
	cp -p ${STYLE-PATH}de-date.sty   styles/
	cp -p ${STYLE-PATH}oneline.sty   styles/
	cp -p ${STYLE-PATH}unified-biblatex.sty          styles/
	cp -p ${STYLE-PATH}unified-biblatex/stmue-langsci-unified.bbx styles/
	cp -p ${STYLE-PATH}unified-biblatex/stmue-langsci-unified.cbx styles/
	cp -p ${STYLE-PATH}Ling/article-ex.sty           styles/
	cp -p ${STYLE-PATH}Ling/merkmalstruktur.sty      styles/
	cp -p ${STYLE-PATH}Ling/my-xspace.sty            styles/
	cp -p ${STYLE-PATH}Ling/my-ccg-ohne-colortbl.sty styles/
	cp -p ${STYLE-PATH}Ling/forest.sty               styles/
	cp -p ${STYLE-PATH}Ling/my-gb4e-slides.sty       styles/
	cp -p ${STYLE-PATH}Ling/cgloss.sty               styles/
	cp -p ${STYLE-PATH}Ling/jambox.sty               styles/
	cp -p ${LANGSCI-PATH}langsci-forest-setup.sty    .



clean:
	find . -name \*\.bak -exec \rm {} \;
	find . -name \*~ -exec \rm {} \;
	rm -f *.bak *.toc *.bbl *.blg *~ *.log *.aux *.*pk *.cut *.tmp *.out *.nav *.snm *.aux.copy *.bcf *.for *.run.xml


realclean: clean
	rm -f *.dvi *.ps *.pdf


