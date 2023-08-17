# cores read from input
cores=$1
timestep=2 #timestep in fs
temp=300 #temperature in K
press=0 #pressure in GPa
num_steps=99 #number of steps

ramble -ompnp $cores -ts $timestep -natom 600 -dr 0.001 -tt $temp -p $press -m $num_steps C > /dev/null 2> times-$cores.txt
grep "total  :" times-$cores.txt | awk -v cores="${cores}" '{print "cores="cores" "$3/1000/100*1000 " ms/at"}' >> bench-out.txt
