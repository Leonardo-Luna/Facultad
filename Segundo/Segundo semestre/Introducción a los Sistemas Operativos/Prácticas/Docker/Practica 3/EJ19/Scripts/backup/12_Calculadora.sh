#! /bin/bash

if [ $# -ne 3 ]; then
	echo "Cantidad de parĂmetros incorrecta."
	exit 1
fi

case $2 in
	"+")
		echo $(($1 $2 $3))
		;;
	"-")
		echo $(($1 $2 $3))
		;;
	"*")
		echo $(($1 $2 $3))
		;;
	"%")
		echo $(($1 $2 $3))
		;;
	*)
		echo "Test"
esac
