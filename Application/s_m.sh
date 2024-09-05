#!/bin/bash

array2=("0512M" "1024M" "1536M" "2048M" "2560M" "3072M" "3584M" "4096M")

for val2 in "${array2[@]}"; do
	combination="${val2}" 
	combinations+=("$combination")
done


shuffled_combinations=($(shuf -e "${combinations[@]}")) 

for i in {1..10}
do
	for combination in "${shuffled_combinations[@]}"; do 
		sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
		free -w -h
		combination_length=${#combination}
		
		var2="${combination:0:5}" 
		
		stress-ng --vm 1 --vm-bytes $var2 -t 15
	done
done
