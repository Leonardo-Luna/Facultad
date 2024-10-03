#! /bin/bash

if [ $# -lt 1 ]; then
	echo "Se debe ingresar por lo menos un parametro."
	exit 1
else

	i=1
	cant=0
	
	for param in $@; do
		
		if [ $((${i} % 2)) -ne 0 ]; then
			
			if [ -e $param ]; then # Si existe verifico el tipo
				if [ -d $param ]; then
					echo "$param existe y es un directorio"
				elif [ -f $param ]; then
					echo "$param existe y es un archivo regular"
				else
					echo "$param existe pero no es directorio ni archivo regular"
				fi
			else # Si no existe, lo informo
				echo "$param no existe"
				let cant++
			fi
		fi
		let i++
	
	done

	echo "De los archivos ingresados en posiciones impares ${cant} no existen"

fi
