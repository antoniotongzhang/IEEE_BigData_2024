#!/bin/bash

array3=("rd-rnd wr-rnd 01G" "rd-seq wr-rnd 01G" "rd-rnd wr-seq 01G" "rd-seq wr-seq 01G" "rd-rnd wr-rnd 10G" "rd-seq wr-rnd 10G" "rd-rnd wr-seq 10G" "rd-seq wr-seq 10G")

for val3 in "${array3[@]}"; do
val3_split=($val3)
           
	combination="${val3_split[0]}${val3_split[1]}${val3_split[2]}"
                
	combinations+=("$combination")
            
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
		
		stress-ng --hdd 1 --hdd-bytes $var5 --hdd-opts fsync,$var3,$var4 -t 15
	done
done
