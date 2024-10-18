if [ $# -ne 1 ]; then
    echo "Se debe ingresar un nombre de usuario como parametro"
    exit 255
fi

if [ $1 != $(cat /etc/passwd | cut -d: -f1 | grep $1) ]; then
    echo "El usuario ingresado no existe en el sistema"
    exit 1
fi

cant=0

while [ cant -le 30 ]; do

    sleep 30

    if [ $(who | cut -d" " -f1 | grep -w $1) = $1 ]; then
        let cant++

        if [ $cant -eq 1 ]; then
            echo "Usuario logueado $(date)" >> /var/log/access-$1.log # El who ya contiene la fecha 
        fi

    fi
    
done

exit 0

