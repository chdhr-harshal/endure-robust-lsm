whoami := $(shell whoami)
target := main
latex := pdflatex
bibtex := bibtex

.PHONY: default
default: all 


.PHONY: all
all:
	$(MAKE) copybib $(target) cleanmost


$(target):
	$(latex) $(target).tex
	$(bibtex) $(target)
	$(latex) $(target).tex
	$(latex) $(target).tex

one:
	$(latex) $(target).tex

bib:
	$(bibtex) $(target)

.PHONY: clean
clean:
	rm -f *~ *.bak \
	$(patsubst %,%.pdf,$(target)) \
	$(patsubst %,%.dvi,$(target)) \
	$(patsubst %,%.log,$(target)) \
	$(patsubst %,%.aux,$(target)) \
	$(patsubst %,%.bbl,$(target)) \
	$(patsubst %,%.blg,$(target)) \
	$(patsubst %,%.lox,$(target)) \
	$(patsubst %,%.upa,$(target)) \
	$(patsubst %,%.fls,$(target)) \
	$(patsubst %,%.out,$(target)) \
	$(patsubst %,%.toc,$(target)) \
	$(patsubst %,%.fdb_latexmk,$(target)) \
	$(patsubst %,%.synctex.gz,$(target)) \
	$(patsubst %,%.upb,$(target))

.PHONY: cleanmost
cleanmost:
	rm -f *~ *.bak \
	$(patsubst %,%.dvi,$(target)) \
	$(patsubst %,%.log,$(target)) \
	$(patsubst %,%.aux,$(target)) \
	$(patsubst %,%.bbl,$(target)) \
	$(patsubst %,%.blg,$(target)) \
	$(patsubst %,%.lox,$(target)) \
	$(patsubst %,%.upa,$(target)) \
	$(patsubst %,%.toc,$(target)) \
	$(patsubst %,%.upb,$(target))


# .PHONY: final
# final: | copybib $(target) cleanmost copy
#final: | makefinal $(targs) cleanmost copy

# .PHONY: draft
# draft: | clean $(target) cleanmost
#draft: | clean makedraft $(targs) cleanmost

.PHONY: copy
copy:
#ifeq ($(whoami),manos)
#	rsync -a top.pdf <someshere>
#endif

.PHONY: copybib
copybib:
#ifeq ($(whoami),manos)
	rm -f library.bib*
# 	wget https://www.dropbox.com/s/fkn18k9nw5s7ulp/library.bib2
	wget https://raw.githubusercontent.com/midaslab-bu/mendeley-library/master/library.bib
#curl -L -o library.bib https://www.dropbox.com/s/fkn18k9nw5s7ulp/library.bib?dl=1
#./fix_bibtex_EPFL.sh
#endif

