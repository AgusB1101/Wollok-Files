import Jugador.*

object nave {
	const property tripulantes = []
	const property impostores = []
	
	const tripulantesGanan = new Exception(message = "Los tripulantes ganan.")
	const impostoresGanan   = new Exception(message = "Los impostores ganan.")
	
	var nivelDeOxigeno = 0
	
	method jugadores() = tripulantes + impostores
	
	method agregarTripulante(unTripulante) {
		tripulantes.add(unTripulante)
	}
	
	method agregarImpostor(unImpostor) {
		impostores.add(unImpostor)
	}
	
	method cuantosImpostoresPermanecen() = impostores.size()
	
	method cuantosTripulantesPermanecen() = tripulantes.size()
	
	method chequearSiTodosTerminaronSusTareas() {
		if (self.todosTerminaronSusTareas())
			throw tripulantesGanan
	}
	
	method chequearNivelDeOxigeno() {
		if (nivelDeOxigeno == 0)
			throw impostoresGanan
	}
	
	method todosTerminaronSusTareas() = self.jugadores().all({unJugador => unJugador.terminoTodasSusTareas()})
	
	method aumentarNivelDeOxigeno(unValor) {
		nivelDeOxigeno += unValor
	}
	
	method disminuirNivelDeOxigeno(unValor) {
		nivelDeOxigeno = (nivelDeOxigeno - unValor).max(0)
	}
	
	method alguienTiene(unItem) = self.jugadores().any({unJugador => unJugador.tieneItem(unItem)})
	
	method cualquierJugador() = self.jugadores().anyOne()
	
	method elJugadorMasSospechoso() = self.jugadores().max({unJugador => unJugador.nivelDeSospecha()})
	
	method votaciones() = self.jugadores().map({unJugador => unJugador.aQuienVota()})
	
	method expulsarA(unJugador) {
		impostores.remove(unJugador)
		tripulantes.remove(unJugador)
		
		self.chequearSiAlguienGana()
	}
	
	method chequearSiAlguienGana() {
		if (self.noHayImpostores())
			throw tripulantesGanan
		else if (self.hayLaMismaCantidadDeTripulantesEImpostores())
			throw impostoresGanan
	}
	
	method noHayImpostores() = impostores.isEmpty()
	
	method hayLaMismaCantidadDeTripulantesEImpostores() = self.cuantosTripulantesPermanecen() == self.cuantosImpostoresPermanecen()
}