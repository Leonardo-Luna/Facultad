#! /bin/bash

select opcion in Listar DondeEstoy QuienEsta Salir
do
	case $opcion in
		Listar)
			echo "El directorio actual tiene: `ls`"
			;;
		DondeEstoy)
			echo "Te encuentras en: `pwd`"
			;;
		QuienEsta)
			echo "Usuarios conectados: `who`"
			;;
		Salir)
			break
			;;
	esac
done	
