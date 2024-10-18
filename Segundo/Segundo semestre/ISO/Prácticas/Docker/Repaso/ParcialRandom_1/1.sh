if [ $# -lt 1 ]; then
    echo "Se debe ingresar por lo menos un parametro"
    exit 1
fi

params=($@)
cant=0

for i in ${params[@]}; do

    echo $i

    if [ ! -e $i ]; then # Primero se reivsa si no existe para no conflictuar la eliminación
        echo "Sumando ${i}"
        let cant++
        continue
    fi

    if [ -f $i ]; then
        gzip $i
    
    elif [ -d $i ]; then
        
        if [ -r $i ]; then
            tar -czvf "${i}.tar.gz" $i
        elif [ -w $i ]; then
            rm -r $i
        fi    
    
    fi

done

echo "Cantidad de archivos que no existen ${cant}"
