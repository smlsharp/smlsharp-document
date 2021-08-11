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
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/P/PH/PHRED/Archive-Zip-1.68.tar.gz
	$(SHA256) $@ 984e185d785baf6129c6e75f8eb44411745ac00bf6122fb1c8e822a3861ec650
src/File-Which-1.27.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/File-Which-1.27.tar.gz
	$(SHA256) $@ 3201f1a60e3f16484082e6045c896842261fc345de9fb2e620fd2a2c7af3a93a
src/IO-String-1.08.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/G/GA/GAAS/IO-String-1.08.tar.gz
	$(SHA256) $@ 2a3f4ad8442d9070780e58ef43722d19d1ee21a803bf7c8206877a10482de5a0
src/Image-Size-3.300.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/R/RJ/RJRAY/Image-Size-3.300.tar.gz
	$(SHA256) $@ 53c9b1f86531cde060ee63709d1fda73cabc0cf2d581d29b22b014781b9f026b
src/Parse-RecDescent-1.967015.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/J/JT/JTBRAUN/Parse-RecDescent-1.967015.tar.gz
	$(SHA256) $@ 1943336a4cb54f1788a733f0827c0c55db4310d5eae15e542639c9dd85656e37
src/Text-Unidecode-1.30.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/S/SB/SBURKE/Text-Unidecode-1.30.tar.gz
	$(SHA256) $@ 6c24f14ddc1d20e26161c207b73ca184eed2ef57f08b5fb2ee196e6e2e88b1c6
src/URI-5.09.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/O/OA/OALDERS/URI-5.09.tar.gz
	$(SHA256) $@ 03e63ada499d2645c435a57551f041f3943970492baa3b3338246dab6f1fae0a
src/Try-Tiny-0.30.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/E/ET/ETHER/Try-Tiny-0.30.tar.gz
	$(SHA256) $@ da5bd0d5c903519bbf10bb9ba0cb7bcac0563882bcfe4503aee3fb143eddef6b
src/Encode-Locale-1.05.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/G/GA/GAAS/Encode-Locale-1.05.tar.gz
	$(SHA256) $@ 176fa02771f542a4efb1dbc2a4c928e8f4391bf4078473bd6040d8f11adb0ec1
src/HTTP-Message-6.33.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTTP-Message-6.33.tar.gz
	$(SHA256) $@ 23b967f71b852cb209ec92a1af6bac89a141dff1650d69824d29a345c1eceef7
src/HTTP-Date-6.05.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTTP-Date-6.05.tar.gz
	$(SHA256) $@ 365d6294dfbd37ebc51def8b65b81eb79b3934ecbc95a2ec2d4d827efe6a922b
src/libwww-perl-6.55.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/O/OA/OALDERS/libwww-perl-6.55.tar.gz
	$(SHA256) $@ c1d0d3a44a039b136ebac7336f576e3f5c232347e8221abd69ceb4108e85c920
src/Pod-Parser-1.63.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/M/MA/MAREKR/Pod-Parser-1.63.tar.gz
	$(SHA256) $@ dbe0b56129975b2f83a02841e8e0ed47be80f060686c66ea37e529d97aa70ccd
src/XML-SAX-Base-1.09.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/G/GR/GRANTM/XML-SAX-Base-1.09.tar.gz
	$(SHA256) $@ 66cb355ba4ef47c10ca738bd35999723644386ac853abbeb5132841f5e8a2ad0
src/XML-LibXML-2.0125.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/XML-LibXML-2.0125.tar.gz
	$(SHA256) $@ 01407fe313893dabb138a817897277dbdabcd0cbcbaca4628a16b7cb6fd86bd7
src/XML-LibXSLT-1.99.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/XML-LibXSLT-1.99.tar.gz
	$(SHA256) $@ 127e17a877fb61e47b9e8b87bf8daad31339a62a00121f9751d522b438b0f7f0
src/LaTeXML-0.8.5.tar.gz: | src
	cd src && curl -L -O https://cpan.metacpan.org/authors/id/B/BR/BRMILLER/LaTeXML-0.8.5.tar.gz
	$(SHA256) $@ 1de821d0df8c88041ee10820188f33feac77d5618de4c0798a296a425f4e2637

define PMBUILD_CMD
	-rm -rf $(patsubst %.tar.gz,%,$<)
	cd src && tar -xf $(notdir $<)
	cd $(patsubst %.tar.gz,%,$<) && PERLLIB=../../lib perl Makefile.PL
	cd $(patsubst %.tar.gz,%,$<) && PERLLIB=../../lib make
	cp -R $(patsubst %.tar.gz,%,$<)/blib/arch/* lib
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
lib/URI.pm: src/URI-5.09.tar.gz | lib
	$(PMBUILD_CMD)
lib/Try/Tiny.pm: src/Try-Tiny-0.30.tar.gz | lib
	$(PMBUILD_CMD)
lib/Encode/Locale.pm: src/Encode-Locale-1.05.tar.gz | lib
	$(PMBUILD_CMD)
lib/HTTP/Message.pm: src/HTTP-Message-6.33.tar.gz | lib
	$(PMBUILD_CMD)
lib/HTTP/Date.pm: src/HTTP-Date-6.05.tar.gz | lib
	$(PMBUILD_CMD)
lib/LWP.pm: src/libwww-perl-6.55.tar.gz lib/Try/Tiny.pm lib/Encode/Locale.pm lib/HTTP/Message.pm lib/HTTP/Date.pm
	$(PMBUILD_CMD)
lib/Pod/Parser.pm: src/Pod-Parser-1.63.tar.gz | lib
	$(PMBUILD_CMD)
lib/XML/SAX/Base.pm: src/XML-SAX-Base-1.09.tar.gz | lib
	$(PMBUILD_CMD)
lib/XML/LibXML.pm: src/XML-LibXML-2.0125.tar.gz | lib
	$(PMBUILD_CMD)
lib/XML/LibXSLT.pm: src/XML-LibXSLT-1.99.tar.gz | lib
	$(PMBUILD_CMD)
lib/LaTeXML.pm: src/LaTeXML-0.8.5.tar.gz lib/Parse/RecDescent.pm
	-rm -rf src/LaTeXML-0.8.5
	cd src && tar -xf LaTeXML-0.8.5.tar.gz
	cd src/LaTeXML-0.8.5 && $(LATEXML_PATCH) | patch -p1
	cd src/LaTeXML-0.8.5 && PERLLIB=../../lib perl Makefile.PL
	cd src/LaTeXML-0.8.5 && PERLLIB=../../lib make
	cp -R src/LaTeXML-0.8.5/blib/lib/* lib
	cd lib/LaTeXML/Package && cp book.cls.ltxml jbook.cls.ltxml
LATEXML_DEPS = \
  lib/Archive/Zip.pm \
  lib/File/Which.pm \
  lib/IO/String.pm \
  lib/Image/Size.pm \
  lib/Text/Unidecode.pm \
  lib/URI.pm \
  lib/LWP.pm \
  lib/Pod/Parser.pm \
  lib/XML/SAX/Base.pm \
  lib/XML/LibXML.pm \
  lib/XML/LibXSLT.pm \
  lib/LaTeXML.pm
bin/latexml: $(LATEXML_DEPS) | bin
	cp src/LaTeXML-0.8.5/blib/script/latexml bin
bin/latexmlpost: $(LATEXML_DEPS) | bin
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
