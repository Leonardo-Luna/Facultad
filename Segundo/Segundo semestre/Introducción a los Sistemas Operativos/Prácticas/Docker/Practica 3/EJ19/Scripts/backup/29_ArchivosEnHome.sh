#! /bin/bash

function verArchivo() {

	for arch in ${arr[@]}; do
		if [ $arch = $nombre ]; then
			echo `cat /home/${nombre}`
			return
		fi
	done

	echo "Archivo no encontrado"
	exit 5

}

function cantidadArchivos() {

	echo "Cantidad de archivos: ${#arr[@]}"

}

function borrarArchivo() {

	pos=0
	for arch in ${arr[@]}; do

		echo "$arch | ${decision} >> $nombre"
		if [ "$arch" = "$nombre" ]; then
			
			case $decision in
				"Si")
					echo "Archivo ${arr[$pos]} eliminado logicamente"
					unset arr[$pos]
					return
					;;
				"No")
					echo "Archivo ${arr[$pos]} eliminado logica y fisicamente"
					unset arr[$pos]
					echo $(rm -f /home/$nombre)
					return
					;;
				*)
					echo "La opcion ingresada no es valida"
					return
					;;
			esac
		fi

		let pos++
	done

	echo "Archivo no encontrado"
	exit 10

}

arr=()

# 2 Implementaciones, cual usar? Usar -R en el ls?
# ls /home | grep ".doc"
# find /home -name "*.doc" 

for arch in `ls /home | grep ".doc"`; do
	arr=(${arr[@]} $arch)
done

echo ${arr[@]}

echo "Ingrese el nombre del archivo cuyo contenido desea ver"
read nombre

verArchivo # Utiliza la variable $nombre

cantidadArchivos # No utiliza variables

echo "Ingrese el nombre del archivo a borrar"
read nombre
echo "Desea que la eliminacion sea solo logica? (Eliminar solo del array)"
read decision

borrarArchivo # Utiliza las variables $nombre y $decision

cantidadArchivos
verArchivo
