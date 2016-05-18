#!/bin/bash

set -e

REPO_DIR="./" # TODO: fix - make it point to repo root

TMP_DIR=$(mktemp -d)
GALLERY_DIR=$TMP_DIR/robocup-pcb

# clone repo to tmp dir and checkout gh-pages branch, then remove old content
git clone git@github.com:robojackets/robocup-pcb $GALLERY_DIR --reference $REPO_DIR
pushd $GALLERY_DIR
git checkout gh-pages
rm -r ./* || true
popd

# copy gallery static files
cp $REPO_DIR/gallery/files/* $GALLERY_DIR

# run gallery-generation python script and place output in tmp repo dir
$REPO_DIR/gallery/main.py $REPO_DIR -o $GALLERY_DIR

# set git info
# git config --global user.name "$GIT_USERNAME"
# git config --global user.email "$GIT_EMAIL"

# commit and push
pushd $GALLERY_DIR
git add .
git commit -m 'updated pcb gallery'
git push origin gh-pages
popd

# cleanup
# rm -rf $TMP_DIR
