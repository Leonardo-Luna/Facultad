#! /bin/bash

if [ $# -ne 3 ]; then
	echo "La cantidad de parametros ingresada no es valida".
	exit 1
else
	ruta=$1
	modo=$2
	nombre=$3

	for arch in `ls ${ruta}`; do
		if [ $modo = "-a" ]; then
			mv "${ruta}/${arch}" "${ruta}/${arch}${nombre}"
		elif [ $modo = "-b" ]; then
			mv "${ruta}/${arch}" "${ruta}/${nombre}${arch}"
		else
			echo "No se modifico nada debido a que no se ingreso un parametro valido."
		fi
	done
fi
