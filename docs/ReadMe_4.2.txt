Actividad 4.2.


Interpretación enunciado:
(PS=Puntos Salud; PC=Puntos Combate)
	- Aplicación Cliente-Servidor RMI

	- Son necesrios 5 jugadores para empezar la partida (clase Jugador incluida (modificable).
		Los jugadores los crea el Servidor
		
	- A cada jugador (con cliente asignado o antes)  se le asignan PS y PC.
		- De forma aleatoria dentro de un margen. Los PS entre 40-60 y PC entre 20-100.

	- Antes de iniciar la partida un cliente 
		- puede ser asignado a jugador libre     iterface= Jugador asignacionJugador()throws RemoteException;

	- Al iniciar la partida cada jugador puede (según clase JuegoInterface incluida (no modificable).
		- Atacar a otro
			- Calcula puntos ataque: iterface= Jugador asignacionJugador()throws RemoteException;
				Calcular Puntos Ataque(random = número aleatorio entre 0 y 1)
				Puntos Ataque = PC (jugador que ataca) * ( 1 - random * random ) / 5 ; 
			- PS Jugador atacado = PS Jugador atacado - Puntos Ataque
			
		- Consultar ranking: iterface= List <Jugador> consultaRanking()throws RemoteException;
			Mostrar jugadores por orden de Puntos de Salud
		
		- Consulta de puntos del cliente.: iterface= Jugador consultaPS(int id)throws RemoteException;
			"Tienes x Puntos de Salud y x Puntos de Combate"


Comportamientos no definidos, pero que considero importantes:

	- Si se intenta concectar un jugador y la partida está completa, que hacemos. 
		- Crear otra partida ?
		- Jugador asignacionJugador() ,  null
 
	- Los jugadores con PS 0 están eliminados.
		
	- Los jugadores eliminados no pueden atacar a nadie.

	- Al final quedará un jugador vivo.
		? y después qué ?
			- Queda así
			- Reseteamos partida y dejamos que entren otros jugadores

Problemas actuales
	OK Ejecutar en mismo main, para agilizar pruebas
	OK iniciar cada cliente - Usar hilos en clientes
	KO Automatizar la partida, para agilizar pruebas
		- Cada jugador ataca al de su derecha??
			- Como sabemos que empezo la partida?
				- Añadir comunicación por sockets??
	KO ejecutar ordenes clientes
	KO Cerrar servidor para no tener que apagarlo manualmente
