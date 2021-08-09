DESTDIR = smlsharp.github.io

all:

VERSION: manual.tex
	sed '/^\\newcommand{\\version}/!d;s/^.*{\(.*\)}$$/VERSION=\1/' $< > $@
include VERSION

all: pdf html
pdf: \
  $(DESTDIR)/docs/ja/documents/$(VERSION)/manual.pdf \
  $(DESTDIR)/docs/en/documents/$(VERSION)/manual.pdf
html: \
  $(DESTDIR)/docs/ja/documents/$(VERSION)/index.html \
  $(DESTDIR)/docs/en/documents/$(VERSION)/index.html

.PHONY: all pdf html clean distclean jekyllify
.DELETE_ON_ERROR:

clean:
	-rm -rf VERSION tmp bin lib
	-rm -rf $(DESTDIR)/docs/ja/documents/$(VERSION)
	-rm -rf $(DESTDIR)/docs/en/documents/$(VERSION)
distclean: clean
	-rm -rf src

src:
	-mkdir $@
lib:
	-mkdir $@
bin:
	-mkdir $@
tmp/ja:
	-mkdir -p $@
tmp/en:
	-mkdir -p $@
$(DESTDIR)/docs/ja/documents/$(VERSION):
	-mkdir -p $@
$(DESTDIR)/docs/en/documents/$(VERSION):
	-mkdir -p $@

tmp/ja/manual.tex: manual.tex | tmp/ja
	sed -E 's/^\\jp(true|false)$$/\\jptrue/' $< > $@
tmp/en/manual.tex: manual.tex | tmp/en
	sed -E 's/^\\jp(true|false)$$/\\jpfalse/' $< > $@

tmp/ja/manual.pdf: tmp/ja/manual.tex
	cd tmp/ja && platex -interaction=nonstopmode manual
	cd tmp/ja && platex -interaction=nonstopmode manual
	cd tmp/ja && dvipdfmx manual

tmp/en/manual.pdf: tmp/en/manual.tex
	cd tmp/en && platex -interaction=nonstopmode manual
	cd tmp/en && platex -interaction=nonstopmode manual
	cd tmp/en && dvipdfmx manual

$(DESTDIR)/docs/ja/documents/$(VERSION)/manual.pdf: tmp/ja/manual.pdf | $(DESTDIR)/docs/ja/documents/$(VERSION)
	cp $< $@
$(DESTDIR)/docs/en/documents/$(VERSION)/manual.pdf: tmp/en/manual.pdf | $(DESTDIR)/docs/en/documents/$(VERSION)
	cp $< $@

tmp/ja/manual.xml: tmp/ja/manual.tex bin/latexml
	PERLLIB=lib bin/latexml --noparse --destination=$@ $<
tmp/en/manual.xml: tmp/en/manual.tex bin/latexml
	PERLLIB=lib bin/latexml --noparse --destination=$@ $<

define LATEXMLPOST_CMD
	PERLLIB=lib bin/latexmlpost --stylesheet=xslt/html.xsl --javascript='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=MML_CHTML' --destination=$@ --split --nographicimages --novalidate $<
	echo '.ltx_page_header .ltx_document_title{margin:1em 0;text-align:center;font-weight:bold}' >> $(patsubst %/index.html,%/LaTeXML.css,$@)
endef

$(DESTDIR)/docs/ja/documents/$(VERSION)/index.html: tmp/ja/manual.xml bin/latexmlpost xslt/html.xsl | $(DESTDIR)/docs/ja/documents/$(VERSION)
	$(LATEXMLPOST_CMD)
$(DESTDIR)/docs/en/documents/$(VERSION)/index.html: tmp/en/manual.xml bin/latexmlpost xslt/html.xsl | $(DESTDIR)/docs/en/documents/$(VERSION)
	$(LATEXMLPOST_CMD)

jekyllify: \
  $(DESTDIR)/docs/ja/documents/$(VERSION)/index.html \
  $(DESTDIR)/docs/en/documents/$(VERSION)/index.html
	scripts/jekyllify.sh \
	  $(DESTDIR)/docs/ja/documents/$(VERSION)/*.html \
	  $(DESTDIR)/docs/en/documents/$(VERSION)/*.html

SHA256 = perl -mDigest::SHA -e 'exit(Digest::SHA->new(256)->addfile($$ARGV[0])->hexdigest() ne $$ARGV[1])'

src/Archive-Zip-1.68.tar.gz: | src
	cd src && curl -L -O https://www.cpan.org/authors/id/P/PH/PHRED/Archive-Zip-1.68.tar.gz
	$(SHA256) $@ 984e185d785baf6129c6e75f8eb44411745ac00bf6122fb1c8e822a3861ec650
src/File-Which-1.27.tar.gz: | src
	cd src && curl -L -O https://www.cpan.org/authors/id/P/PL/PLICEASE/File-Which-1.27.tar.gz
	$(SHA256) $@ 3201f1a60e3f16484082e6045c896842261fc345de9fb2e620fd2a2c7af3a93a
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

define PMBUILD_CMD
	-rm -rf $(patsubst %.tar.gz,%,$<)
	cd src && tar -xf $(notdir $<)
	cd $(patsubst %.tar.gz,%,$<) && PERLLIB=../../lib perl Makefile.PL
	cd $(patsubst %.tar.gz,%,$<) && PERLLIB=../../lib make
	cp -R $(patsubst %.tar.gz,%,$<)/blib/lib/* lib
endef

lib/Archive/Zip.pm: src/Archive-Zip-1.68.tar.gz | lib
	$(PMBUILD_CMD)
lib/File/Which.pm: src/File-Which-1.27.tar.gz | lib
	$(PMBUILD_CMD)
lib/IO/String.pm: src/IO-String-1.08.tar.gz | lib
	$(PMBUILD_CMD)
lib/Image/Size.pm: src/Image-Size-3.300.tar.gz | lib
	$(PMBUILD_CMD)
lib/Parse/RecDescent.pm: src/Parse-RecDescent-1.967015.tar.gz | lib
	$(PMBUILD_CMD)
lib/Text/Unidecode.pm: src/Text-Unidecode-1.30.tar.gz | lib
	$(PMBUILD_CMD)
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
