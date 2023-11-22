if [ $# -eq 0 ];
    then echo "usage: ./bench.sh <list of number of cores>"
fi

for i in *.tar.gz; do
	
	root=${i%%.*}
	tar -zxf $i

	echo "Now doing" $root

	cd $root

	for cores in "$@"; do
		echo $cores "core(s)"
		./run.sh $cores
	done

	echo ""

	cd ..

done
