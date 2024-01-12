#!/bin/bash

num_runs=$1

for i in `seq 1 $num_runs`; do
		
	# repackage output of previous runs	
	for j in *.tar.gz; do
	
		root=${j%%.*}
			
		if [ ! -d $root ]; then
			tar -zxf $j
		fi

		rm $j

		cd $root
		echo "Run" $i >> bench-out.txt
		rm -f *-out.cell times-*
		cd ..

		tar -zcf $j $root
		rm -r $root

	done
		
	./bench.sh
	
done
