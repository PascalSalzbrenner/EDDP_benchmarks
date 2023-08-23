if [ $# -eq 0 ];
    then echo "usage: ./bench.sh <list of number of cores>"
fi

for i in *.tar.gz; do
	
	root=${i%%.*}
	tar -zxf $i
	cd $root

	for cores in "$@"; do
		./run.sh $cores
	done

	cd ..

done
