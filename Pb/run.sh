# cores read from input
cores=$1
timestep=2 # timestep in fs
temp=500 # temperature in K
press=0 # pressure in GPa
num_steps=99 # number of steps

ramble -ompnp $cores -ts $timestep -dr 0 -tt $temp -p $press -m $num_steps Pb-coex > /dev/null 2> times-$cores.txt
grep "total  :" times-$cores.txt | awk -v cores="${cores}" '{print "cores="cores" "$3/2040/100*1000 " ms/at"}' >> bench-out.txt
