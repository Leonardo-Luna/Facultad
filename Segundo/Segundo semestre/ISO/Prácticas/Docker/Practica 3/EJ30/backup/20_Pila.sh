#! /bin/bash

function length() {
	echo "Longitud: ${#pila[@]}"
}

function print() {
	
	# 2 posibles impementaciones
	# echo ${pila[@]}
	
	for elem in ${pila[@]}; do
		echo ${elem}
	done

}

function push() {
	pila=(${pila[@]} $elem)
}

function pop() {
	l=${#pila[@]}

	if [ ${l} -gt 0 ]; then
		popeado=${pila[$((l-1))]}
		unset pila[$((l-1))]
		echo "Se hizo pop del elemento ${popeado}"
	else
		echo "No se pudo realizar el pop. La pila esta vacia."
	fi
}
