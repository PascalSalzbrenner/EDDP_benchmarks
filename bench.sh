#!/bin/bash

while getopts ":c:e:h" opt; do
        case $opt in
                c)
                        # list of the core numbers which will be used for the benchmark runs 
                        cores=("$OPTARG")
                        until [[ $(eval "echo \${$OPTIND}") =~ ^-.* ]] || [ -z $(eval "echo \${$OPTIND}") ]; do
                                cores+=($(eval "echo \${$OPTIND}"))
                                OPTIND=$((OPTIND + 1))
                        done;;
                e)
                        # name of the ramble executable used to run the job
                        executable=$OPTARG;;
                h)
                        echo "Script to run the EDDP benchmarks contained in .tar.gz tarballs in this directory"
                        echo "Usage: bench.sh [-c cores] [-e executable]"
                        echo ""
                        echo "Optional arguments"
                        echo "-c cores               : list of core numbers at which the benchmarks will be run"
                        echo "-e executable          : the ramble executable used to run the benchmarks"
                        echo "-h                     : print this message and exit"
                        echo ""
                        echo "The following defaults apply: -c 1 $(nproc --all) -e ramble"
                        exit 1
        esac
done

if [ -z $cores ]; then
        cores=(1 `nproc --all`)
fi

if [ -z $executable ]; then
        executable="ramble"
fi

for i in *.tar.gz; do
	
	root=${i%%.*}
	tar -zxf $i

	echo "Now doing" $root

	cd $root

	for num_cores in ${cores[@]}; do
		echo $num_cores "core(s)"
		./run.sh $num_cores $executable
	done

	echo ""

	cd ..

done
