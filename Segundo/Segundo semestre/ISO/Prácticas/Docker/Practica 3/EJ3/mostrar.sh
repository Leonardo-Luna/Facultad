#!/bin/bash

# Comentarios acerca de lo que hace el script
# Siempre comento mis scripts, si no hoy lo hago
# y ma√±ana ya no me acuerdo de lo que quise hacer
echo "Introduzca su nombre y apellido:"
read nombre apellido
echo "Fecha y hora actual:"
date
echo "Su apellido y nombre es:"
echo "$apellido $nombre"
usuario=$(whoami)
echo "Su usuario es: ${usuario}"
echo "Su directorio actual es: `pwd`"
echo "Su espacio libre en disco es: `df --total | grep total`"
echo "Su directorio personal es `cat /etc/passwd | grep ${usuario} | cut -f6 -d:`"
echo "Ingrese la ruta absoluta de un directorio para ver su contenido:"
read ruta
echo "`ls ${ruta}`"

# Modificaciones hechas:
# - Utilizaci√n de la variable $usuario
# - Impresi√n del directorio actual
# - Mostrar el espacio libre en el disco
# - Mostrar el directorio personal del usuario que ejecuta el comando
# - Pedir una ruta absoluta por teclado e imprimir su contenido

