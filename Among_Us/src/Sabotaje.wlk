import Jugador.*
import Nave.*

class Sabotaje {
	
	const autor
	
	method realizarSabotaje() {
		autor.aumentarNivelDeSospecha(5)
	}
}

class ReducirOxigeno inherits Sabotaje {
	
	override method realizarSabotaje() {
		if(not nave.alguienTiene("Tubo de Oxígeno")) {
			nave.disminuirNivelDeOxigeno(10)
			nave.chequearNivelDeOxigeno()
		}
		super()
	}
}

class ImpugnarJugador inherits Sabotaje {
	const jugadorAImpugnar
	
	override method realizarSabotaje() {
		autor.obligarAVotarEnBlanco(jugadorAImpugnar)
		super()
	}
}