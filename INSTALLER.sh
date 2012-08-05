#!/bin/bash

# Copy the images, assets, and javascripts into the rails-jquery gem.

# This is the path to the original JsTree GitHub checkout: 
#  git://github.com/vakata/jstree.git
SRC_DIR=/opt/gems/jstree

# Everything that we copy from the original jstree distribution goes here.
ASSET_DIR=./vendor/assets

# Additional plugins that are not part of the 'official' JsTree distribution.
PLUGINS_DIR=./plugins

rm -rf $ASSET_DIR
mkdir -p $ASSET_DIR/stylesheets/jstree/themes/default
mkdir -p $ASSET_DIR/stylesheets/jstree/themes/default-rtl
mkdir -p $ASSET_DIR/images/jstree/themes/default
mkdir -p $ASSET_DIR/images/jstree/themes/default-rtl
mkdir -p $ASSET_DIR/javascripts/jstree

#
# By design, plugins modified by Quosap overwrite those
# in the original distribution.  We can't simply create
# a new contextmenu plugin with a different name, for example,
# because the name "contextmenu" is referred to in vakata.
#
cp $SRC_DIR/src/*.js $ASSET_DIR/javascripts/jstree
cp $PLUGINS_DIR/* $ASSET_DIR/javascripts/jstree

# Caution, the order of these matters.
cat > $ASSET_DIR/javascripts/jstree/index.js <<__EOF__
//= require jstree/vakata.js
//= require jstree/jstree.js
//= require jstree/jstree.checkbox.js
//= require jstree/jstree.contextmenu.js
//= require jstree/jstree.dnd.js
//= require jstree/jstree.hotkeys.js
//= require jstree/jstree.html.js
//= require jstree/jstree.json.js
//= require jstree/jstree.rules.js
//= require jstree/jstree.sort.js
//= require jstree/jstree.state.js
//= require jstree/jstree.themes.js
//= require jstree/jstree.ui.js
//= require jstree/jstree.unique.js
//= require jstree/jstree.xml.js
//= require jstree/jstree.helpers.js
__EOF__

# You will need this somewhere in your javascript to
# select a theme.
# $.jstree.THEMES_DIR = '/assets/jstree/themes/';

# Copy theme images.
cp $SRC_DIR/src/themes/default/{*.gif,*.png} \
  $ASSET_DIR/images/jstree/themes/default

cp $SRC_DIR/src/themes/default-rtl/{*.gif,*.png} \
  $ASSET_DIR/images/jstree/themes/default-rtl

# Copy theme stylesheets.
cp $SRC_DIR/src/themes/default/*.css \
  $ASSET_DIR/stylesheets/jstree/themes/default

cp $SRC_DIR/src/themes/default-rtl/*.css \
  $ASSET_DIR/stylesheets/jstree/themes/default-rtl

(cd $SRC_DIR && tar cf - docs ) | tar xf -
