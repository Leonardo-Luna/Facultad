#! /bin/bash

for nombre in `ls`; do
	echo $(echo ${nombre} | tr -d "aA" | tr "a-zA-Z" "A-Za-z")
done
