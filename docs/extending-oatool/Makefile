TEXC = latexmk
CLEAN = latexmk -c
OPTIONS = -xelatex -shell-escape

all: extending-oatool

extending-oatool: extending-oatool.tex
	$(TEXC) $(OPTIONS) extending-oatool.tex
	$(CLEAN( $(OPTIONS)

clean:
	$(CLEAN) $(OPTIONS)
	rm -rf _minted-extending-oatool

