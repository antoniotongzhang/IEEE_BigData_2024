#!/bin/bash

array2=("0512M" "1024M" "1536M" "2048M" "2560M" "3072M" "3584M" "4096M")
array4=("ipv4 send" "ipv4 sendmmsg" "ipv6 send" "ipv6 sendmmsg" "ipv4 --sock-nodelay send" "ipv4 --sock-nodelay sendmmsg" "ipv6 --sock-nodelay send" "ipv6 --sock-nodelay sendmmsg") 

for val2 in "${array2[@]}"; do      
	for val4 in "${array4[@]}"; do                
                val4_split=($val4)
                combination="${val2}${val4_split[0]}${val4_split[1]}${val4_split[2]}"
                
                combinations+=("$combination")
	done
       
done

shuffled_combinations=($(shuf -e "${combinations[@]}")) 

for i in {1..10}
do
	for combination in "${shuffled_combinations[@]}"; do 
		sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
		free -w -h
		combination_length=${#combination}
		
		var2="${combination:0:5}" 
		
		var6="${combination:5:4}"
		if [ $combination_length -gt 22 ]; then
			var7="${combination:9:14}"
			var8="${combination:23}"
			stress-ng --sock 1 --sock-domain $var6 $var7 --sock-opts $var8 --vm 1 --vm-bytes $var2 -t 15
		else
			var7="${combination:9}"
			stress-ng --sock 1 --sock-domain $var6 --sock-opts $var7 --vm 1 --vm-bytes $var2 -t 15
		fi
	done
done
