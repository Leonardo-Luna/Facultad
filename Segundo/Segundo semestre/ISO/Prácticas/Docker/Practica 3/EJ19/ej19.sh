#! /bin/bash

# Carga del array de archivos

arr=()
for arch in `ls ./Scripts`; do
	arr=(${arr[@]} $(echo ${arch} | cut -d"/" -f3))
done
arr=(${arr[@]} "salir")

# Funcion mostrar array

function mostrar() {
	echo "Seleccione un archivo: [ARCHIVO] [PARAM 1] [PARAM 2] [PARAM N]"
	i=1
	for a in ${arr[@]}; do
		echo "${i} - ${a}"
		let i++
	done
}

# Script en si

mostrar
read seleccion
num=$(echo ${seleccion} | cut -d" " -f1)

while [ ${num} -ne ${#arr[@]} ]; do

	if [ ${num} -gt 0 ] && [ ${num} -le ${#arr[@]} ]; then
		params=$(echo $seleccion | cut -d" " -f1 --complement)
		echo $(./Scripts/${arr[$((num - 1))]} $params)
	fi

	mostrar
	read seleccion
	num=$(echo ${seleccion} | cut -d" " -f1)
	
done
