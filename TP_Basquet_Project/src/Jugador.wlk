import Estilo.*

class Jugador {
    const property altura
    var property eficaciaTriples
    const property nivelDeInteligencia
    var property talentoDeManejo
    var property estiloJugador
    var property esSucio
    var nivelDeStaminaActual = 100
    const nivelDeStaminaInicial = nivelDeStaminaActual

    method aumentarTalento(unPorcentaje) {
        talentoDeManejo = talentoDeManejo + talentoDeManejo * unPorcentaje / 100
    }

    method aumentarEficacia(unPorcentaje) {
        eficaciaTriples = eficaciaTriples + eficaciaTriples * unPorcentaje / 100
    }

	method entrenar(unPorcentaje) {
		self.aumentarTalento(unPorcentaje)
		self.aumentarEficacia(unPorcentaje)
		self.cansar()
	}

    method habilidad() = estiloJugador.habilidad(self) - self.cansancio()

    method esCrack() {
        return self.habilidad() > 90
    }
    method esCrackSegunEstilo(estilo) {
        return estilo.habilidad(self) > 90
    }

    method esLeyenda() {
        const estilos = [tirador, pasador, reboteador]
        return estilos.all({estilo => self.esCrackSegunEstilo(estilo)}) 
    }
    
    method nivelDeStamina() = nivelDeStaminaActual
    
    method cansancio() = nivelDeStaminaInicial - nivelDeStaminaActual
    
    method cansar() {
    	nivelDeStaminaActual = (nivelDeStaminaActual - estiloJugador.cansancioPorEntrenamiento()).max(0) 
    }
    
    method descansar(unosPuntosDeStamina) {
    	nivelDeStaminaActual = (nivelDeStaminaActual + unosPuntosDeStamina).min(100)
    }
    
    method siSeCansaDisminuyeSuStaminaMenosDe(unValor) = estiloJugador.cansancioPorEntrenamiento() <= unValor
}



object juan inherits Jugador(altura = 180, eficaciaTriples = 60, nivelDeInteligencia = 30,
							 talentoDeManejo = 60, estiloJugador = tirador, esSucio = true) {
}

object franco inherits Jugador(altura = 200, eficaciaTriples = 10, nivelDeInteligencia = 70,
							  talentoDeManejo = 70, estiloJugador = reboteador, esSucio = true) {
}

object aye inherits Jugador(altura = 167, eficaciaTriples = 35, nivelDeInteligencia = 80,
							talentoDeManejo = 85, estiloJugador = pasador, esSucio = false) {
}

object lebron inherits Jugador(altura = 700, eficaciaTriples = 90, nivelDeInteligencia = 95,
							   talentoDeManejo = 90, estiloJugador = pasador, esSucio = true) {
	
}