#! /bin/bash

num=(10 3 5 7 9 3 5 4)

result=1

for num in ${num[@]}; do
	result=$((${num} * ${result}))
done

echo ${result}
