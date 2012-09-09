#/bin/bash
OUTPUT=vendor/assets/javascripts/jstree/jstree.min.js
SRC=vendor/assets/javascripts/jstree
YUICOMPRESSOR=/opt/yuicompressor/yuicompressor-2.4.7/build/yuicompressor-2.4.7.jar
rm -f $OUTPUT
for f in \
    $SRC/vakata.js \
    $SRC/jstree.js \
    $SRC/jstree.checkbox.js \
    $SRC/jstree.contextmenu.js \
    $SRC/jstree.dnd.js \
    $SRC/jstree.hotkeys.js \
    $SRC/jstree.html.js \
    $SRC/jstree.json.js \
    $SRC/jstree.rules.js \
    $SRC/jstree.sort.js \
    $SRC/jstree.state.js \
    $SRC/jstree.themes.js \
    $SRC/jstree.ui.js \
    $SRC/jstree.unique.js \
    $SRC/jstree.xml.js \
    $SRC/jstree.helpers.js
do
  echo $f
  java -jar $YUICOMPRESSOR $f >> $OUTPUT
done

