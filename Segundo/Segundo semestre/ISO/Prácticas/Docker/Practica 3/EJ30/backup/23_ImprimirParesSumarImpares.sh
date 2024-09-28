#! /bin/bash

arr=(1 2 3 4 5 6 7 8 9 10)

contador=0
cant=0

for num in ${arr[@]}; do
	if [ $((${num} % 2)) -eq 0 ]; then
		echo ${num}
	else
		contador=$((${contador} + ${num}))
		let cant++
	fi
done

# "Cuente solo los numeros impares" Cantidad de la suma o cantidad de numeros impares?
echo "La suma de los numeros impares es: ${contador}"
echo "La cantidad de numeros impares es: ${cant}"
