#!/bin/bash
ori=`pwd`
cd ..
dir=`pwd`
echo "cd to " $dir
for i in `ls $dir`
do
	each=$dir/$i
	echo "for cd1 to " $each
	cd $each
	$ori/commitAndPush.sh
	cd $dir
done
