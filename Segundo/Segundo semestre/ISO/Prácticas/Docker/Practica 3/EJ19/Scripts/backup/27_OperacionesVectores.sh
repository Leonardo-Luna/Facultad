#! /bin/bash

function inicializar() {
	arr=()
	echo "Array vacio creado"
}

function agregar_elem() {
	arr=(${arr[@]} $elem)
	echo "Elemento $elem agregado"
}

function eliminar_elem() {
	long=${#arr[@]}

	if [ $pos -ge 0 ] && [ $pos -lt $long ]; then
		echo "Se elimino el elemento ${arr[$pos]}"
		unset arr[$pos]
	else
		echo "La posicion ingresada no es valida"
	fi

}

function longitud() {
	echo "Longitud: ${#arr[@]}"
}

function imprimir() {
	echo "Elementos cargados: ${arr[@]}"
}

function inicializar_con_valores() {
	
	arr=()

	for i in `seq 1 $cant`; do
		arr[$i]=$elem
	done

	echo "Array cargado creado"

}

inicializar # Sin parametros

echo "Ingrese un valor para agregar al arreglo"
read elem

agregar_elem # Utiliza la variable "elem"
agregar_elem
agregar_elem

longitud # Sin parametros
imprimir # Sin parametros

echo "Ingrese una posicion a eliminar"
read pos

eliminar_elem # Utiliza la variable "pos"

longitud
imprimir

echo "Ingrese una longitud para el nuevo array"
read cant
echo "Ingrese el valor para la creacion del nuevo array"
read elem

inicializar_con_valores # Utiliza las variables "cant" y "elem"

longitud
imprimir
