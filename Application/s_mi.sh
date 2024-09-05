#!/bin/bash

array2=("0512M" "1024M" "1536M" "2048M" "2560M" "3072M" "3584M" "4096M")
array3=("rd-rnd wr-rnd 01G" "rd-seq wr-rnd 01G" "rd-rnd wr-seq 01G" "rd-seq wr-seq 01G" "rd-rnd wr-rnd 10G" "rd-seq wr-rnd 10G" "rd-rnd wr-seq 10G" "rd-seq wr-seq 10G")

for val2 in "${array2[@]}"; do
	for val3 in "${array3[@]}"; do
        val3_split=($val3)
            
                combination="${val2}${val3_split[0]}${val3_split[1]}${val3_split[2]}"
                
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
		
		var3="${combination:5:6}" 
		
		var4="${combination:11:6}" 
		
		var5="${combination:17:3}" 
		
		stress-ng --vm 1 --vm-bytes $var2 --hdd 1 --hdd-bytes $var5 --hdd-opts fsync,$var3,$var4 -t 15		
	done
done

