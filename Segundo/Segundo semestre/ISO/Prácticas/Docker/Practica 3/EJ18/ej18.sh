#! /bin/bash

if [ $# -ne 1 ]; then
	echo "La cantidad de parametros pasada no es valida."
	exit 1
else
	while [ `who | grep ${1} | cut -d" " -f1 | wc -l` -le 1 ]; do
		sleep 10
	done
	
	echo $(who | grep ${1} | cut -d" " -f1 | wc -l)
	echo "Usuario ${1} logueado en el sistema"
fi
