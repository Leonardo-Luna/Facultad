#! /bin/bash

echo "El home del usuario root es:  $(cat /etc/passwd | grep root | cut -f1 -d:)"

# -f (fields) permite seleccionar las columnas a mostrar
# -d (delimiter) sirve para filtrar mediante un delimitador

echo "Columnas 2-4 del usuario root: $(cat /etc/passwd | grep root | cut -f2-4)"

# -f tambienn permite seleccionar un rango de campos/columnas a mostrar

echo "Primeros 8 caracteres del usuario root: $(cat /etc/passwd | grep root | cut -c 1-8)"

# -c (characters) permite seleccionar un rango de caracteres

echo "Complemento de -f1: $(cat /etc/passwd | grep root | cut -d: -f1 --complement)"

# --complement muestra todos los campos excepto los seleccionados
