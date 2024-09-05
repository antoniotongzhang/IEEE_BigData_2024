#!/bin/bash

array3=("rd-rnd wr-rnd 01G" "rd-seq wr-rnd 01G" "rd-rnd wr-seq 01G" "rd-seq wr-seq 01G" "rd-rnd wr-rnd 10G" "rd-seq wr-rnd 10G" "rd-rnd wr-seq 10G" "rd-seq wr-seq 10G")
array4=("ipv4 send" "ipv4 sendmmsg" "ipv6 send" "ipv6 sendmmsg" "ipv4 --sock-nodelay send" "ipv4 --sock-nodelay sendmmsg" "ipv6 --sock-nodelay send" "ipv6 --sock-nodelay sendmmsg")

for val3 in "${array3[@]}"; do
val3_split=($val3)
	for val4 in "${array4[@]}"; do
                
		val4_split=($val4)
		combination="${val1}${val2}${val3_split[0]}${val3_split[1]}${val3_split[2]}${val4_split[0]}${val4_split[1]}${val4_split[2]}"
               
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
	
		var3="${combination:0:6}" 
		
		var4="${combination:6:6}" 
		
		var5="${combination:12:3}" 
		var6="${combination:15:4}"
		if [ $combination_length -gt 32 ]; then
			var7="${combination:19:14}"
			var8="${combination:33}"
			stress-ng --sock 1 --sock-domain $var6 $var7 --sock-opts $var8 --hdd 1 --hdd-bytes $var5 --hdd-opts fsync,$var3,$var4 -t 15
		else
			var7="${combination:19}"
			stress-ng --sock 1 --sock-domain $var6 --sock-opts $var7 --hdd 1 --hdd-bytes $var5 --hdd-opts fsync,$var3,$var4 -t 15
		fi
	done
done
