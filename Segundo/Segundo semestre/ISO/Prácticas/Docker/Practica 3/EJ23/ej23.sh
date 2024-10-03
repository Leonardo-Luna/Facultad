#! /bin/bash

arr=(1 2 3 4 5 6 7 8 9 10)

cant=0

for num in ${arr[@]}; do
	if [ $((${num} % 2)) -eq 0 ]; then
		echo ${num}
	else
		let cant++
	fi
done

# "Cuente solo los numeros impares" Cantidad de la suma o cantidad de numeros impares?
# Post consulta: Solo se contabiliza la cantidad de impares.

echo "La cantidad de numeros impares es: ${cant}"
