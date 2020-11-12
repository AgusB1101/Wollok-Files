import Tarea.*
import Nave.*
import Sabotaje.*

class Jugador {
	const property color
	const property personalidad
	const property mochila = []
	var   		   nivelDeSospecha = 40
	const property tareasARealizar = []
	
	var estaObligado = false
	
	method obligarAVotarEnBlanco() {
		estaObligado = true
	}
	
	method nivelDeSospecha() = nivelDeSospecha
	
	method esSospechoso() = nivelDeSospecha > 50
	
	method buscarItem(unItem) {
		mochila.add(unItem)
	}
	
	method tieneItem(unItem) = mochila.contains(unItem)
	
	method perderItem(unItem) {
		mochila.remove(unItem)
	}
	
	method tieneMochilaVacia() = mochila.isEmpty()
	
	method realizarTarea(unaTarea)
	
	method disminuirNivelDeSospecha(unValor) {
		nivelDeSospecha = (nivelDeSospecha - unValor).max(0)
	}
	
	method aumentarNivelDeSospecha(unValor) {
		nivelDeSospecha += unValor
	}
	
	method subirNivelDeOxigenoEnNave(unValor) {
		nave.aumentarNivelDeOxigeno(unValor)
	}
	
	method informarALaNave() {
		nave.chequearSiTodosTerminaronSusTareas()
	}
	
	method terminoTodasSusTareas() = tareasARealizar.all({unaTarea => unaTarea.seRealizo()})
	
	method votarEnBlanco() = "Voto en Blanco"
	
	method aQuienVota()
	
	method hacerReunionDeEmergencia() {
		const votaciones= nave.votaciones()
		const elMasVotado = votaciones.max({unVoto => votaciones.occurrencesOf(unVoto)})
		
		if (elMasVotado != "Voto en Blanco")
			nave.expulsarA(elMasVotado)		
	}
}

class Tripulante inherits Jugador {
	
	override method realizarTarea(unaTarea) {
		unaTarea.serRealizadaPor(self)
	}
	
	override method aQuienVota() {
		if(estaObligado) {
			estaObligado = false
			return self.votarEnBlanco()
		}	
		else 
			return personalidad.votarSegunPersonalidad()
	 }
}

class Impostor inherits Jugador {
	override method realizarTarea(unaTarea) {
		
	}
	
	override method terminoTodasSusTareas() = true
	
	method obligarAVotarEnBlanco(unJugador) {
		unJugador.obligarAVotarEnBlanco()
	}
	
	method realizarSabotaje(unSabotaje) {
		unSabotaje.realizarSabotaje()
	}
	
	override method aQuienVota() = nave.cualquierJugador()
}