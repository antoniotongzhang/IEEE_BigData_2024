#!/bin/bash

array1=("012" "024" "036" "048" "060" "072" "084" "100")
array2=("0512M" "1024M" "1536M" "2048M" "2560M" "3072M" "3584M" "4096M")
array3=("rd-rnd wr-rnd 01G" "rd-seq wr-rnd 01G" "rd-rnd wr-seq 01G" "rd-seq wr-seq 01G" "rd-rnd wr-rnd 10G" "rd-seq wr-rnd 10G" "rd-rnd wr-seq 10G" "rd-seq wr-seq 10G")

for val1 in "${array1[@]}"; do
    for val2 in "${array2[@]}"; do
        for val3 in "${array3[@]}"; do
        val3_split=($val3)
                combination="${val1}${val2}${val3_split[0]}${val3_split[1]}${val3_split[2]}"
                combinations+=("$combination")
            
        done
    done
done
 
shuffled_combinations=($(shuf -e "${combinations[@]}")) 

for i in {1..5}
do
	for combination in "${shuffled_combinations[@]}"; do 
		sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
		free -w -h
		combination_length=${#combination}
		
		var1="${combination:0:3}" 
		
		var2="${combination:3:5}" 
		
		var3="${combination:8:6}" 
		
		var4="${combination:14:6}" 
		
		var5="${combination:20:3}" 
		
		stress-ng --cpu 1 --cpu-load $var1 --vm 1 --vm-bytes $var2 --hdd 1 --hdd-bytes $var5 --hdd-opts fsync,$var3,$var4 -t 15		
	done
done
