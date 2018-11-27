#!/bin/bash
set -x
dirname=`mktemp -d`
cd $dirname
git init .
echo "initial file on master" > one.txt
git add one.txt
git commit -m 'initial commit master'
git checkout -b 'overnight'
echo "second line in original file only on overnight" > one.txt
git add one.txt
git commit -m 'initial commit overnight' one.txt
echo "merging overnight into master"
git checkout master
git merge --no-ff -m 'Merging overnight into master' overnight
ls -l
git log
cd ..
rm -rf "$dirname"
