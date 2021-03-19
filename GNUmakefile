all:

VERSION: manual.tex
	sed '/^\\newcommand{\\version}/!d;s/^.*{\(.*\)}$$/VERSION=\1/' $< > $@
include VERSION

all: pdf html
pdf: ja/manual.pdf en/manual.pdf
html: ja/documents/$(VERSION)/index.html en/documents/$(VERSION)/index.html

.PHONY: all pdf html
.DELETE_ON_ERROR:

clean:
	-rm -rf VERSION bin lib ja en
distclean:
	-rm -rf VERSION bin lib ja en src

src:
	-mkdir $@
lib:
	-mkdir $@
bin:
	-mkdir $@
ja:
	-mkdir $@
en:
	-mkdir $@
ja/documents/$(VERSION):
	-mkdir -p $@
en/documents/$(VERSION):
	-mkdir -p $@

ja/manual.tex: manual.tex | ja
	sed -E 's/^\\jp(true|false)$$/\\jptrue/' $< > $@
en/manual.tex: manual.tex | en
	sed -E 's/^\\jp(true|false)$$/\\jpfalse/' $< > $@

ja/manual.pdf: ja/manual.tex
	cd ja && platex -interaction=nonstopmode manual
	cd ja && platex -interaction=nonstopmode manual
	cd ja && dvipdfmx manual

en/manual.pdf: en/manual.tex
	cd en && platex -interaction=nonstopmode manual
	cd en && platex -interaction=nonstopmode manual
	cd en && dvipdfmx manual

ja/manual.xml: ja/manual.tex bin/latexml
	PERLLIB=lib bin/latexml --noparse --destination=$@ $<
en/manual.xml: en/manual.tex bin/latexml
	PERLLIB=lib bin/latexml --noparse --destination=$@ $<

ja/documents/$(VERSION)/index.html: ja/manual.xml bin/latexmlpost | ja/documents/$(VERSION)
	PERLLIB=lib bin/latexmlpost --format=html5 --javascript='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=MML_CHTML' --destination=$@ --split --nographicimages --novalidate $<
	git log -n1 --format='<!--%H-->' HEAD >> $@
en/documents/$(VERSION)/index.html: en/manual.xml bin/latexmlpost | en/documents/$(VERSION)
	PERLLIB=lib bin/latexmlpost --format=html5 --javascript='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=MML_CHTML' --destination=$@ --split --nographicimages --novalidate $<
	git log -n1 --format='<!--%H-->' HEAD >> $@

SHA256 = perl -mDigest::SHA -e 'exit(Digest::SHA->new(256)->addfile($$ARGV[0])->hexdigest() ne $$ARGV[1])'

src/Archive-Zip-1.68.tar.gz: | src
	cd src && curl -L -O https://www.cpan.org/authors/id/P/PH/PHRED/Archive-Zip-1.68.tar.gz
	$(SHA256) $@ 984e185d785baf6129c6e75f8eb44411745ac00bf6122fb1c8e822a3861ec650
src/File-Which-1.23.tar.gz: | src
	cd src && curl -L -O https://www.cpan.org/authors/id/P/PL/PLICEASE/File-Which-1.23.tar.gz
	$(SHA256) $@ b79dc2244b2d97b6f27167fc3b7799ef61a179040f3abd76ce1e0a3b0bc4e078
src/IO-String-1.08.tar.gz: | src
	cd src && curl -L -O https://www.cpan.org/authors/id/G/GA/GAAS/IO-String-1.08.tar.gz
	$(SHA256) $@ 2a3f4ad8442d9070780e58ef43722d19d1ee21a803bf7c8206877a10482de5a0
src/Image-Size-3.300.tar.gz: | src
	cd src && curl -L -O https://www.cpan.org/authors/id/R/RJ/RJRAY/Image-Size-3.300.tar.gz
	$(SHA256) $@ 53c9b1f86531cde060ee63709d1fda73cabc0cf2d581d29b22b014781b9f026b
src/Parse-RecDescent-1.967015.tar.gz: | src
	cd src && curl -L -O https://www.cpan.org/authors/id/J/JT/JTBRAUN/Parse-RecDescent-1.967015.tar.gz
	$(SHA256) $@ 1943336a4cb54f1788a733f0827c0c55db4310d5eae15e542639c9dd85656e37
src/Text-Unidecode-1.30.tar.gz: | src
	cd src && curl -L -O https://www.cpan.org/authors/id/S/SB/SBURKE/Text-Unidecode-1.30.tar.gz
	$(SHA256) $@ 6c24f14ddc1d20e26161c207b73ca184eed2ef57f08b5fb2ee196e6e2e88b1c6
src/LaTeXML-0.8.5.tar.gz: | src
	cd src && curl -L -O https://www.cpan.org/authors/id/B/BR/BRMILLER/LaTeXML-0.8.5.tar.gz
	$(SHA256) $@ 1de821d0df8c88041ee10820188f33feac77d5618de4c0798a296a425f4e2637

lib/Archive/Zip.pm: src/Archive-Zip-1.68.tar.gz | lib
	-rm -rf src/Archive-Zip-1.68
	cd src && tar -xf Archive-Zip-1.68.tar.gz
	cd src/Archive-Zip-1.68 && perl Makefile.PL && make
	cp -R src/Archive-Zip-1.68/blib/lib/Archive lib
lib/File/Which.pm: src/File-Which-1.23.tar.gz | lib
	-rm -rf src/File-Which-1.23
	cd src && tar -xf File-Which-1.23.tar.gz
	cd src/File-Which-1.23 && perl Makefile.PL && make
	cp -R src/File-Which-1.23/blib/lib/File lib
lib/IO/String.pm: src/IO-String-1.08.tar.gz | lib
	-rm -rf src/IO-String-1.08
	cd src && tar -xf IO-String-1.08.tar.gz
	cd src/IO-String-1.08 && perl Makefile.PL && make
	cp -R src/IO-String-1.08/blib/lib/IO lib
lib/Image/Size.pm: src/Image-Size-3.300.tar.gz | lib
	-rm -rf src/Image-Size-3.300
	cd src && tar -xf Image-Size-3.300.tar.gz
	cd src/Image-Size-3.300 && perl Makefile.PL && make
	cp -R src/Image-Size-3.300/blib/lib/Image lib
lib/Parse/RecDescent.pm: src/Parse-RecDescent-1.967015.tar.gz | lib
	-rm -rf src/Parse-RecDescent-1.967015
	cd src && tar -xf Parse-RecDescent-1.967015.tar.gz
	cd src/Parse-RecDescent-1.967015 && perl Makefile.PL && make
	cp -R src/Parse-RecDescent-1.967015/blib/lib/Parse lib
lib/Text/Unidecode.pm: src/Text-Unidecode-1.30.tar.gz | lib
	-rm -rf src/Text-Unidecode-1.30
	cd src && tar -xf Text-Unidecode-1.30.tar.gz
	cd src/Text-Unidecode-1.30 && perl Makefile.PL && make
	cp -R src/Text-Unidecode-1.30/blib/lib/Text lib
lib/LaTeXML.pm: src/LaTeXML-0.8.5.tar.gz | lib
	-rm -rf src/LaTeXML-0.8.5
	cd src && tar -xf LaTeXML-0.8.5.tar.gz
	cd src/LaTeXML-0.8.5 && $(LATEXML_PATCH) | patch -p1
	cd src/LaTeXML-0.8.5 && perl Makefile.PL && make
	cp -R src/LaTeXML-0.8.5/blib/lib/LaTeXML* lib
	cd lib/LaTeXML/Package && cp book.cls.ltxml jbook.cls.ltxml
bin/latexml: lib/Archive/Zip.pm lib/File/Which.pm lib/IO/String.pm lib/Image/Size.pm lib/Parse/RecDescent.pm lib/Text/Unidecode.pm lib/LaTeXML.pm | bin
	cp src/LaTeXML-0.8.5/blib/script/latexml bin
bin/latexmlpost: lib/Archive/Zip.pm lib/File/Which.pm lib/IO/String.pm lib/Image/Size.pm lib/Parse/RecDescent.pm lib/Text/Unidecode.pm lib/LaTeXML.pm | bin
	cp src/LaTeXML-0.8.5/blib/script/latexmlpost bin

LATEXML_PATCH = printf -- '\
|--- LaTeXML-0.8.5/lib/LaTeXML/resources/XSLT/LaTeXML-structure-xhtml.xsl.orig	2020-11-10 03:32:59.000000000 +0900\n\
|+++ LaTeXML-0.8.5/lib/LaTeXML/resources/XSLT/LaTeXML-structure-xhtml.xsl	2021-03-19 21:41:54.000000000 +0900\n\
|@@ -390,10 +390,12 @@\n\
|       <xsl:call-template name="authors">\n\
|         <xsl:with-param name="context" select="$$context"/>\n\
|       </xsl:call-template>\n\
|+      <xsl:if test="(parent::ltx:document)">\n\
|       <xsl:call-template name="dates">\n\
|         <xsl:with-param name="context" select="$$context"/>\n\
|         <xsl:with-param name="dates" select="../ltx:date"/>\n\
|       </xsl:call-template>\n\
|+      </xsl:if>\n\
|     </xsl:if>\n\
|     <xsl:apply-templates select="." mode="end">\n\
|       <xsl:with-param name="context" select="$$context"/>\n\
' | sed 's/^ |//'
