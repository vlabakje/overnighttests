#!/bin/bash
set -x
dirname=`mktemp -d`
cd $dirname
git init .
echo "initial file on master" > one.txt
git add one.txt
git commit -m 'initial commit master'
git checkout -b 'overnight'
echo "initial file only on overnight" > two.txt
git add two.txt
git commit -m 'initial commit overnight' two.txt
echo "merging overnight into master"
git checkout master
echo "third file only on master" > three.txt
echo "second line in first file" > one.txt
git commit -am 'third master commit'
git checkout overnight
echo "second change on overnight" >> two.txt
git commit -am 'second overnight commit'
git checkout master
git merge --no-ff -m 'Merging overnight into master' overnight
ls -l
git log
cd ..
rm -rf "$dirname"
