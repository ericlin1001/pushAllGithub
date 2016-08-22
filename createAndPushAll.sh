#!/bin/bash
cd ..
dir=`pwd`
echo $dir
for i in `ls $dir`
do
	$each=$dir/$i
	cd $each
	github-create
	cd $dir
done
