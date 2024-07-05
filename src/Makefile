PROJ  = thesis
LC    = latexmk
LOGS  = .auxtex
FLAGS = -pdfxe -pdfxelatex="xelatex -halt-on-error" -bibtex \
        -outdir=$(LOGS) -M -MP -MF $(LOGS)/$(PROJ).deps

all : mkdirs | $(PROJ).pdf

$(PROJ).pdf : $(PROJ).tex mkdirs img FORCE_MAKE
	-$(LC) $(FLAGS) $<
	cp $(LOGS)/$@ .
	# xdg-open "$@"

mkdirs :
	mkdir -p $(LOGS)/chap

clean :
	rm -rf $(PROJ).pdf $(LOGS)

cleanall : clean
	+cd img && make clean; cd ..

.PHONY : FORCE_MAKE clean cleanall img mkdirs slides

-include $(LOGS)/$(PROJ).deps