#! /bin/bash

if [ $# -eq 2 ]; then
	num1=$1
	num2=$2

	echo "Multiplicacion - $(($num1 * $num2))"
	echo "Suma - $(($num1 + $num2))"
	echo "Resta - $(($num1 - $num2))"

	if [ $num1 -gt $num2 ]; then
		echo "$num1 es mayor que $num2"
	elif [ $num1 -lt $num2 ]; then
		echo "$num2 es mayor que $num1"
	else
		echo "Los numeros son iguales"
	fi
else
	echo "La cantidad de parametros ingresada no es valida"
	exit 1
fi
