#! /bin/bash

vector1=(1 80 65 35 2)
vector2=(5 98 3 41 8)

i=0

for num in ${vector1[@]}; do

	suma=$((num + ${vector2[${i}]}))
	echo "La suma de los elementos de la posicion ${i} de los vectores es ${suma}"
	let i++

done
