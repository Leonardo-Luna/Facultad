#! /bin/bash

arr=$(ls ./backup | grep ".sh")
cant=0

if [ ! -d /home/bin ]; then
	echo "Se creo el directorio "bin" en /home/"
	echo $(mkdir /home/bin)
fi

for arch in ${arr[@]}; do
	echo "Moviendo ${arch}"
	let cant++
	echo $(mv ./backup/${arch} /home/bin/${arch})
done

echo "Archivos movidos: ${cant}"
