# SML# Document

This repository contains the source of SML# Document.

Do `make` to obtain the documantation in PDF and HTML format.

TeXLive (pLaTeX & dvipdfmx) is needed to build PDF files.

Perl is needed to build HTML files.
LaTeXML and its prerequisite libraries are downloaded from CPAN
and set up during `make`.

To put website's header and footer in LaTeXML-generated webpages,
run `make jekyllify` after running `make`.  The `jekyllify` script
transforms each HTML file to one that Jekyll can handle.
