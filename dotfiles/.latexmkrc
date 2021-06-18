# vim: ft=perl

# Read the documentation: https://ctan.org/pkg/latexmk

# https://manpages.debian.org/testing/latexmk/latexmk.1.en.html#FORMAT_OF_COMMAND_SPECIFICATIONS
$pdflatex = 'xelatex -interaction=nonstopmode -halt-on-error -synctex=1 %O %S';
