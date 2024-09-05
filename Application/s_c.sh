#!/bin/bash

# different configurations
array1=("012" "024" "036" "048" "060" "072" "084" "100")

# generate combinations
for val1 in "${array1[@]}"; do
	combination="${val1}"
        
	combinations+=("$combination")
done


shuffled_combinations=($(shuf -e "${combinations[@]}")) 

# number of iteration could be changed, we use 10 for running single intensive tasks, or combined with two tasks
for i in {1..10}
do
	for combination in "${shuffled_combinations[@]}"; do 
		#clean cache
		sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
		free -w -h
		combination_length=${#combination}
		# Extract and store substrings in variables 
		var1="${combination:0:3}" 
		
		stress-ng --cpu 1 --cpu-load $var1 -t 15
	done
done
