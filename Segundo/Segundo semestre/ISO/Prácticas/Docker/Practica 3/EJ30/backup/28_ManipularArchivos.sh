#! /bin/bash

if [ $# -ne 1 ]; then
	echo "Se debe ingresar la ruta de un directorio como parametro"
	exit 1
else

	cant=0

	if [ -e $1 ]; then
		
		for arch in `ls $1`; do
			
			ruta="$1"/"$arch"
			if [ -f $ruta ]; then
				if [ -r $ruta ] && [ -w $ruta ]; then
					let cant++
				fi
			fi

		done

		echo "En el directorio $1 tiene permiso de lectura y escritura sobre $cant archivos"

	else
		echo "El directorio buscado no existe"
		exit 4
	fi

fi
