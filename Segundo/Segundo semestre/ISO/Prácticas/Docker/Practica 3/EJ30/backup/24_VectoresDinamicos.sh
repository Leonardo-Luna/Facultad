#! /bin/bash

vector1=(1 80 65 35 2)
vector2=(5 98 3 41 8)

# "Cuyas longitudes no se conocen" Pero son iguales? O tengo que chequear las longitudes para
# no acceder a una posicion que no existe?

# Sin revisar las longitudes

i=0

for num in ${vector1[@]}; do

	suma=$((num + ${vector2[${i}]}))
	echo "La suma de los elementos de la posicion ${i} de los vectores es ${suma}"
	let i++

done

echo # Revisando longitudes

i=0

for num in ${vector1[@]}; do

	if [ ${i} -lt ${#vector2[@]} ]; then
		suma=$((num + ${vector2[${i}]}))
	else
		suma=${num}
	fi
	
	echo "La suma de los elementos de la posicion ${i} de los vectores es ${suma}"
	let i++

done
