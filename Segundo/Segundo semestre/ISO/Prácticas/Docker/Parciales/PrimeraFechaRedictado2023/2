#! /bin/bash
# ISO/CSO - Redictado 2023 - SOA - Primera fecha 3/5/2023
# Segundo script

function listar() {

	for i in ${nombres[@]}; do
		echo $i
	done

}

function eliminar() {

	for ((i=0; i<${#nombres[@]}; i++)); do
		echo "$i - ${nombres[$i]}"
	done

	read eleccion

	unset nombres[$eleccion]

}

function contar() {

	echo ${#nombres[@]}

}

if [ $# -ne 1 ]; then
	exit 1
fi

nombres=($(cat /etc/passwd | grep $1 | cut -d: -f1))

select opcion in Listar Eliminar Contar Salir; do
	case $opcion in
		Listar)
			listar
			;;
		Eliminar)
			eliminar
			;;
		Contar)
			contar
			;;
		Salir)
			break
			;;
	esac
done
