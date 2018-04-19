#**************
#*** CONMED ***
#**************
#
clear
unset password
unset pass
#Función para mostrar texto letra por letra
function unoauno
{
    mensaje="$1"
    tiempo="$2"

    for i in $(seq 0 $(expr length "${mensaje}")) ; do
	echo -n "${mensaje:$i:1}"
        sleep ${tiempo}
    done
}
#
echo
echo `setterm -foreground white -bold on`.
echo
echo
echo "                                            _ "
echo "                                           ( )"
echo "   ___    _     ___    ___ ___     __     _| |"
echo " /'___) /'_ \ /' _  \/' _ ' _ '\ /'__'\ /'_' |"
echo "( (___ ( (_) )| ( ) || ( ) ( ) |(  ___/( (_| |"
echo "'\____)'\___/'(_) (_)(_) (_) (_)'\____)'\__,_)"
echo "               Hackeando desde android - Ivam3"
echo
echo
echo
echo `setterm -foreground white -bold off`

password="acm"
unoauno "INGRESA LA CONTRASEÑA" .03
echo `setterm -foreground green`
#read pass

while read -p ">>>> " pass && [[ -z "$pass" ]] ; do
 echo "No ingresaste una contraseña, por favor ingresa una!"
done

intentos=2
Fin="Último"
until [ $pass = $password ];
do
    echo
    echo `setterm -foreground white`La contraseña \
	 `setterm -foreground red -bold on`$pass \
	 `setterm -foreground white`no es correcta, \
	 `setterm -foreground red`Intento $intentos:\
	 `setterm -foreground white`
    echo Contraseña: `setterm -foreground green`
    # read pass
    while read -p ">>>> " pass && [[ -z "$pass" ]] ; do
	echo "No ingresaste una contraseña, por favor ingresa una!"
    done
									    
    
    if [ $intentos = 4 ];then
	intentos=$Fin
    fi
    if [ $intentos = $Fin ];then
	echo
	echo
	unoauno "DEMASIADOS INTENTOS... CERRANDO TERMUX" .03
	echo
	sleep 1
	clear
	cmatrix
	exit
    fi
	  
    intentos=$[$intentos + 1]
done

echo
echo cargando TERMUX
echo
# Barra de progreso de 10 en 10%
porcen=0
until [ $porcen = 110 ];do
    setterm -background white
    setterm -foreground blue
    echo -en "▒▒▒" && sleep .1
    setterm -foreground red
    setterm -foreground blue -bold on
    echo -en $porcen "\b% " && sleep .05
    echo -ne '\b\b\b\b' && sleep .02
    echo -ne && sleep .2
    setterm -foreground white
    setterm -background black

    porcen=$[$porcen+10]
done

echo `setterm -foreground blue -bold on`
echo
echo "*************************"
unoauno "*** BIENVENIDO CONMED ***" .01
echo
echo "*************************"
echo
echo `setterm -foreground white`



