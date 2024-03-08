#CyberghostVPN

#Para que nos muestre una lista de los paises:
cyberghostvpn --traffic --country-code

#Si queremos que nos muestre una lista de las cuidades de un pais:
cyberghostvpn --traffic --country-code XX

#Si queremos ver un listado de los servidores que hay en una determinada ciudad:
cyberghostvpn --traffic --country-code XX --city "CIUDAD"

#----------------------------------------------------------

#Como levantar un tunel VPN:
sudo cyberghostvpn --traffic --country-code XX --connect
sudo cyberghostvpn --traffic --country-code XX --city "CIUDAD"  --connect
sudo cyberghostvpn --traffic --country-code XX --city "CIUDAD" --server SERVIDOR --connect

#Ejemplo de conexion a un servidor concreto de un pais:
sudo cyberghostvpn --traffic --country-code BS --city "Nassau" --server nassau-s402-i01 --connect


#Para poder para la conexion VPN:
sudo cyberghostvpn --stop
