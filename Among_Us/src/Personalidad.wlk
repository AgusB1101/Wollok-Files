import Nave.*
import Jugador.*

object troll {
	method votarSegunPersonalidad() = nave.jugadores().findOrDefault({unJugador => not unJugador.esSospechoso()}, "Voto en Blanco")
}

object detective {
	method votarSegunPersonalidad() = nave.elJugadorMasSospechoso()
}

object materialista {
	method votarSegunPersonalidad() = nave.jugadores().findOrDefault({unJugador => unJugador.tieneMochilaVacia()}, "Voto en Blanco")
}