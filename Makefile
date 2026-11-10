.PHONY: proposal report clean

proposal:
	cd Project/proposal && latexmk -pdf -interaction=nonstopmode -file-line-error main.tex

report:
	cd Project/report && latexmk -pdf -interaction=nonstopmode -file-line-error main.tex

tex-clean:
	cd Project/proposal && latexmk -c
	cd Project/report && latexmk -c
