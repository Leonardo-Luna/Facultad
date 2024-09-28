#! /bin/bash

# Valores del 1 al 10 y cuadrados del 1 al 100
for valor in `seq 1 100`; do
	cuadrado=$(($valor * $valor))
	echo "Numero: $valor - Cuadrado: $cuadrado"
done
