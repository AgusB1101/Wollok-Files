class Equipo {
	const property guardian
	const property golpeadores = []
	const property cazadores = []
	const property buscador
	
	var puntos = 0
	
	method integrantes() = [guardian] + golpeadores + cazadores  + [buscador]
	
	method cantidadDeIntegrantes() = self.integrantes().size()
	
	method habilidadPromedio() {
		const sumaDeHabilidades = self.integrantes().sum({unIntegrante => unIntegrante.habilidad()})
		
		return sumaDeHabilidades / self.cantidadDeIntegrantes()
	}
	
	method tieneJugadorEstrellaContra(unEquipo) {
		return self.integrantes().any({unIntegrante => unIntegrante.esJugadorEstrellaContra(unEquipo)})
	}
	
	method lePasaElTrapoAlEquipo(unJugador) {
		return self.integrantes().all({unIntegrante => unJugador.lePasaElTrapoA(unIntegrante)})
	}
	
	method jugarContra(unEquipo) {
		self.integrantes().forEach({unIntegrante => unIntegrante.jugarContra(unEquipo)})
	}
	
	method elCazadorMasRapido() = cazadores.max({unCazador => unCazador.velocidad()})
	
	method atraparQuaffle() {
		const elCazadorMasRapido = self.elCazadorMasRapido()
		
		elCazadorMasRapido.atraparQuaffle()
	}
	
	method algunIntegrantePuedeBloquearA(unJugador) {
		return self.integrantes().any({unIntegrante => unIntegrante.puedeBloquearA(unJugador)})
	}
	
	method integrantesQuePuedenBloquearA(unJugador) {
		return self.integrantes().filter({unIntegrante => unIntegrante.puedeBloquearA(unJugador)})
	}
	
	method elPrimerIntegranteQuePuedeBloquearA(unJugador) {
		return self.integrantesQuePuedenBloquearA(unJugador).first()
	}
	
	method cualquierIntegrante() = self.integrantes().anyOne()
	
	method puntos() = puntos
	
	method ganarPuntos(unosPuntos) {
		puntos += unosPuntos
	}
	
	method tieneLaQuaffle() = self.integrantes().any({unIntegrante => unIntegrante.tieneLaQuaffle()})
}
