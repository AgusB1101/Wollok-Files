import Jugador.*
import Equipo.*
import TipoEntrenador.*

class Entrenador {
	const property nombre
	const property apellido
	const property edad
	var equipo
	var   property tipo
	
	method dirigir(unEquipo) {
		equipo = unEquipo
		unEquipo.entrenador(self)
	}
	
	method multiplicadorDeHabilidad() = tipo.multiplicador(equipo)
	
	method entrenar(unJugador) {
		unJugador.entrenar(10)
	}
	
	method entrenarEquipo() {
		equipo.entrenarATodos()
		tipo.modificarEquipo(equipo)
	}
}

object felipeScarpa inherits Entrenador(nombre = "Federico", apellido = "Scarpa",
									    edad = 25, tipo = motivador) {
}

object carusoLombardi inherits Entrenador(nombre = "Ricardo", apellido = "Caruso Lombardi",
										  edad = 58, tipo = vendehumo) {									  	
}

object beckyHammon inherits Entrenador(nombre = "Becky", apellido = "Hammon",
									   edad = 43, tipo = fino) {
}


