#!/bin/bash

array4=("ipv4 send" "ipv4 sendmmsg" "ipv6 send" "ipv6 sendmmsg" "ipv4 --sock-nodelay send" "ipv4 --sock-nodelay sendmmsg" "ipv6 --sock-nodelay send" "ipv6 --sock-nodelay sendmmsg") 

for val4 in "${array4[@]}"; do
	val4_split=($val4)
	combination="${val4_split[0]}${val4_split[1]}${val4_split[2]}"
	combinations+=("$combination")
done

shuffled_combinations=($(shuf -e "${combinations[@]}")) 

for i in {1..10}
do
	for combination in "${shuffled_combinations[@]}"; do 
		sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
		free -w -h
		combination_length=${#combination}
	
		var6="${combination:0:4}"
		if [ $combination_length -gt 17 ]; then
			var7="${combination:4:14}"
			var8="${combination:18}"
			stress-ng --sock 1 --sock-domain $var6 $var7 --sock-opts $var8 -t 15
		else
			var7="${combination:4}"
			stress-ng --sock 1 --sock-domain $var6 --sock-opts $var7 -t 15
		fi
	done
done
