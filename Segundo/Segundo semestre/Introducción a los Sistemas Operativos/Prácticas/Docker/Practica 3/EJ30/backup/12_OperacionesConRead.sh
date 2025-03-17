#! /bin/bash

echo "Ingrese un numero"
read num1

echo "Ingrese otro numero"
read num2

echo "Multiplicacion -  $(($num1 * $num2))"
echo "Suma - $(($num1 + $num2))"
echo "Resta - $(($num1 - $num2))"

if [ $num1 -gt $num2 ]; then
	echo "$num1 es mayor que $num2"
elif [ $num1 -lt $num2 ]; then
	echo "$num2 es mayor que $num1"
else
	echo "Los numeros son iguales"
fi

