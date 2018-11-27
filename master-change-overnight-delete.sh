#!/bin/bash
set -x
dirname=`mktemp -d`
cd $dirname
git init .
echo "initial file on master" > one.txt
git add one.txt
git commit -m 'initial commit master'
git checkout -b 'overnight'
echo "second file only on overnight" > two.txt
git add two.txt
git commit -m 'initial commit overnight' two.txt
git checkout master
echo "second line in original file only on master" > one.txt
git add one.txt
git commit -m 'second commit master' one.txt
git checkout overnight
git rm one.txt
git commit -m 'remove commit overnight'
echo "merging overnight into master"
git checkout master
# this will fail and should generate an alert
git merge --stat --no-ff -m 'Merging overnight into master' overnight
cd ..
rm -rf "$dirname"
