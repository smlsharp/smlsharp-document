#!/bin/sh
for i
do
  permalink=${i#*/docs/}
  lang=${permalink%%/*}
  sed -i.orig '
1i\
---\
layout: default\
permalink: '"$permalink"'\
translated: true\
lang: '"$lang"'
/^<!DOCTYPE html><html>$/d
/^<head>$/,/^<\/head>$/{s/^/ /;/^ *$/d;}
/^ *<title>/{h;d;}
s/^ *<head>$/head: |/
/^ *<\/head>$/{g;s/^ *<title>\(.*\)<\/title>/title: "\1"\n---/;}
s/^<body>$/{% raw %}/
s/^<\/body>$/{% endraw %}/
/^<\/html>$/d
' "$i"
  rm "$i".orig
done
