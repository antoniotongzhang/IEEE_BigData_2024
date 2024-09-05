#!/bin/bash

array1=("012" "024" "036" "048" "060" "072" "084" "100")
array2=("0512M" "1024M" "1536M" "2048M" "2560M" "3072M" "3584M" "4096M")

for val1 in "${array1[@]}"; do
	for val2 in "${array2[@]}"; do
		combination="${val1}${val2}"
                
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
		
		var1="${combination:0:3}" 
		
		var2="${combination:3:5}" 
		
		stress-ng --cpu 1 --cpu-load $var1 --vm 1 --vm-bytes $var2 -t 15		
	done
done