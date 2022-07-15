#!/bin/bash
# Copyright (c) Alexander B. Prokopyev, 2022 \n

N1=1;
N2=100;

method1()
{
	for I in $(seq $N1 1 $N2); do
	        if [ $(($I%3)) -eq 0 ]; then 
	        	echo "$I"; 
	        fi;
	done;
}

method2()
{
	for I in $(seq $N1 3 $((N2-2))); do
		echo "$((I+2))";
	done;
}

method1;
#method2;
