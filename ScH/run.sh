# cores read from input
cores=$1
timestep=0.5 #timestep in fs
temp=1000 #temperature in K
press=350 #pressure in GPa
num_steps=99 #number of steps

ramble -ompnp $cores -ts $timestep -natom 600 -dr 0.001 -tt $temp -p $press -m $num_steps ScH > /dev/null 2> times-$cores.txt
grep "total  :" times-$cores.txt | awk -v cores="${cores}" '{print "cores="cores" "$3/600/100*1000 " ms/at"}' >> bench-out.txt
