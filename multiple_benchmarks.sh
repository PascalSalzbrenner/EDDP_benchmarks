#!/bin/bash

num_runs=$1

for i in `seq 1 $num_runs`; do
		
	# repackage output of previous runs	
	for j in `ls *.tar.gz`; do
	
		fileroot=${j%%.*}
			
		if [ ! -d $fileroot ]; then
			tar -zxf $j
		fi

		rm $j

		cd $fileroot
		echo "Run" $i >> bench-out.txt
		rm -f *-out.cell times-*
		cd ..

		tar -zcf $j $fileroot
		rm -r $fileroot

	done
		
	./bench.sh
	
done
