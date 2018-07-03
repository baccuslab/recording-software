TEXC = latexmk
CLEAN = latexmk -c
OPTIONS = -xelatex -shell-escape

all: closed-loop

closed-loop: closed-loop.tex
	$(TEXC) $(OPTIONS) closed-loop.tex
	$(CLEAN( $(OPTIONS)

clean:
	$(CLEAN) $(OPTIONS)
	rm -rf _minted-closed-loop

