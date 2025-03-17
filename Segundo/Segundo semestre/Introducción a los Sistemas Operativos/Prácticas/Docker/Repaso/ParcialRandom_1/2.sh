function existe() {

    if [ $# -ne 1 ]; then
        echo "Se debe pasar un parametro"
        exit 255
    fi

    for i in ${arr[@]}; do
        if [ $i == $1 ]; then
            echo "Existe"
            return 0
        fi

        echo "No existe"
        exit 1
    done

}

function eliminar_usuario() {

    if [ $# -ne 1 ]; then
        echo "Se debe ingresar un parametro"
        exit 255
    fi

    for i in $(seq 0 $((${#arr[@]}-1))); do
        
        if [ ${arr[$i]} == $1 ]; then
            unset arr[$i]
            return 0
        fi
    
    done

    exit 2

}

function cantidad() {
    echo ${#arr[@]}
}

function usuarios() {
    echo ${arr[@]}
}

arr=($(cat /etc/passwd | cut -d: -f1))