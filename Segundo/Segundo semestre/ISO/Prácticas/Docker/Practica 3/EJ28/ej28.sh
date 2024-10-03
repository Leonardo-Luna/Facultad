#! /bin/bash

if [ $# -ne 1 ]; then
	echo "Se debe ingresar la ruta de un directorio como parametro"
	exit 1
else

	cantW=0
	cantR=0

	if [ -d $1 ]; then
		
		for arch in `ls $1`; do
			
			ruta="$1"/"$arch"
			if [ -f $ruta ]; then
				if [ -r $ruta ]; then
					let cantR++
				elif [ -w $ruta ]; then
					let cantW++	
				fi
			fi

		done

		echo "En el directorio $1 tiene permiso de lectura sobre ${cantR} y escritura sobre ${cantW} archivos"

	else
		echo "El directorio buscado no existe"
		exit 4
	fi

fi
