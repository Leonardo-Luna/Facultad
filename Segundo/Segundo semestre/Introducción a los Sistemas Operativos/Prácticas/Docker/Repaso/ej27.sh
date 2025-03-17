#! /bin/bash
# Practica 3 - Ejercicio 27

function inicializar() {
    array=()
}

function agregar_elem() {
    if [ $# -ne 1 ]; then
        echo "Se debe ingresar un parametro"
        exit 1
    fi

    array+=($1)
}

function eliminar_elem() {
    if [ $# -ne 1 ]; then
        echo "Se debe ingresar un parametro"
        exit 1
    fi

    if [ $1 -ge ${#array[@]} ] || [ $1 -le 0 ]; then
        echo "Posicion invalida"
        exit 1
    fi

    unset array[$1]
}

function longitud() {
    echo ${#array[@]}
}

function imprimir() {
    for i in ${array[@]}; do
        echo $i
    done
}

function inicializar_con_valores() {
    if [ $# -ne 2 ]; then
        echo "Se deben ingresar dos parametros"
        exit 1
    fi

    for i in $(seq 0 $(($1-1))); do
        array[$i]=$2
    done
}

inicializar_con_valores 5 "a"
imprimir