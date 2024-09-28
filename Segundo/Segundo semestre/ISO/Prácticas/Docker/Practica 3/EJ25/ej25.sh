#! /bin/bash

arr=()

for u in `cat /etc/passwd | grep users | cut -d: -f1`; do
	arr=(${arr[@]} ${u})
done

# "Puede recibir como parametro", entiendo que el parametro es opcional.

if [ $# -eq 1 ]; then
	
	case $1 in
		-l)
			echo ${#arr[@]}
			;;
		-i)
			echo ${arr[@]}
			;;
		*)
			echo "El parametro ingresado no es valido"
			;;
	esac

elif [ $# -eq 2 ]; then

	longitud=${#arr[@]}
	
	if [ $1 = "-b" ]; then
		if [ $2 -ge 0 ] && [ $2 -lt $longitud ]; then
			echo "El usuario de la posicion $2 es ${arr[$2]}"
		else
			echo "La posicion ingresada no es valida"
		fi
	else
		echo "El parametro ${1} no es valido"
	fi
	
else
	echo "No se ingreso ningun parametro o la cantidad de parametros no es valida"
fi

