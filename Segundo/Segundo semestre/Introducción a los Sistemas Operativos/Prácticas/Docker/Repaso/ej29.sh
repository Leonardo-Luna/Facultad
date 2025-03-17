#! /bin/bash
# Practica 3 - Ejercicio 29

function verArchivo() {
    
    if [ $# -ne 1 ]; then
        echo "Se debe ingresar el nombre del archivo a mostrar"
        exit 1
    fi

    for i in ${archivos[@]}; do
        if [ $i == $1 ]; then
            echo $(cat $i)
            return 0;
        fi
    done

    echo "Archivo no encontrado"
    return 5;
}

function cantidadArchivos() {
    echo ${#archivos[@]}
}

function borrarArchivo() {

    if [ $# -ne 1 ]; then
        echo "Se debe ingresar el nombre del archivo a borrar"
        exit 1
    fi

    if [ ${#archivos[@]} -le 0 ]; then
        echo "Archivo no encontrado (array vacio)"
        return 10
    fi

    for i in `seq 0 $((${#archivos[@]}-1))`; do
        if [ ${archivos[$i]} == $1 ]; then   

            echo "Desea solo eliminar el archivo de manera logica? S/N"
            read respuesta

            if [ $respuesta == "N" ]; then
                rm $1
            fi

            unset archivos[$i]
            #archivos=(${archivos[@]})
            return 0

        fi
    done

    echo "Archivo no encontrado"
    return 10

}

archivos=($(find /home -type f -name "*.doc")) # Carga el array de archivos

select opcion in "Ver Archivo" "Cantidad Archivos" "Borrar Archivo" "Salir"; do
    case $opcion in
        "Ver Archivo")
            verArchivo $1
            ;;
        "Cantidad Archivos")
            cantidadArchivos
            ;;
        "Borrar Archivo")
            borrarArchivo $1
            ;;
        "Salir")
            exit 0
            ;;
        *)
            echo "Opción incorrecta"
            ;;
    esac
done        
