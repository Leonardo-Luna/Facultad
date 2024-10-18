#!/bin/bash
# ISO/CSO - Redictado 2023 - SOA - Primera fecha 3/5/2023
# Primer script

if [ $# -lt 2 ]; then
	exit 1;
fi

params=($@)
fecha=$1

if [ -f $archivo ]; then
	#Con el for de C imprime bien. Usando el for i in `seq 1 ${#params[@]}` imprime uno extra que esta vacio
	for ((i=1; i<${#params[@]}; i++)); do
		cant=$(cat "/var/log/access.$fecha.log" | grep "${params[$i]}" | wc -l)
		echo "IP ${params[$i]} - Accesos $cant"
		#echo "IP: ${params[$i]} - Accesos: $cant" >> archivo.txt
	done

fi

