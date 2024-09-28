#! /bin/bash

if [ $# -ne 1 ]; then
	echo "La cantidad de parametros recibir es invalida."
	exit 1
else
	listado=$(cat/etc/passwd)
	for usuario in `echo ${listado} | cut -d: -f1`; do
		home=$(echo ${listado} | grep ${usuario} | cut -d: -f6 ) # Se podria filtrar x UID 1000 o /home
		i=0
		for arch in `ls -R ${home} | cut -d. -f2`; do
			if [ $1 =  $arch ]; then
				let i++
			fi
		done
		echo "El usuario ${usuario}, home ${home} tiene ${i} archivos con la extension ${1}" >> reportes.txt
	done
fi

# Se debe verificar sobre TODOS los usuarios del sistema o solo los de personas?
# Que tan mal esta el for que recorre los archivos? Seria mejor implementarlo con un wc -l?
