TEXC = latexmk
CLEAN = latexmk -c
OPTIONS = -xelatex -shell-escape

all: adding-data-sources

adding-data-sources: adding-data-sources.tex
	$(TEXC) $(OPTIONS) adding-data-sources.tex
	$(CLEAN( $(OPTIONS)

clean:
	$(CLEAN) $(OPTIONS)
	rm -rf _minted-adding-data-sources

