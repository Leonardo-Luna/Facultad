#! /bin/bash

if [ $# -ne 1 ]; then
	echo "La cantidad de parametros ingresada no es valida"
	exit 1
else
	if [ -e $1 ]; then
		if [ -d $1 ]; then
			echo "El archivo existe y es un directorio"
		elif [ -f $1 ]; then
			echo "El archivo existe y es un archivo regular"
		else
			echo "El archivo existe, no es directorio ni regular"
		fi
	else
		echo "El archivo no existe, creando directorio"
		mkdir $1
	fi
fi

