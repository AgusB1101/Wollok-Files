import Jugador.*
import Equipo.*

class Cazador inherits Jugador {	
	var tieneLaQuaffle = false
	
	override method habilidad() = super() + punteria * fuerza
	
	method tieneLaQuaffle() = tieneLaQuaffle
	
	method atraparQuaffle() {
		tieneLaQuaffle = true
	}
	
	method perderQuaffle() {
		tieneLaQuaffle = false
	}
	
	override method puedeBloquearA(unJugador) = self.lePasaElTrapoA(unJugador)
	
	override method esBlancoUtil() = self.tieneLaQuaffle()
	
	override method serGolpeadoPorUnaBludger() {
		super()
		if (self.tieneLaQuaffle())
			self.perderQuaffle()
	}
	
	override method jugarContra(unEquipo) {
		self.intentarMeterGolContra(unEquipo)
	}
	
	method intentarMeterGolContra(unEquipo) {
		if(tieneLaQuaffle)
			self.evitarBloqueosDe(unEquipo)		
		self.perderQuaffle()
		unEquipo.atraparQuaffle()
	}
	
	method evitarBloqueosDe(unEquipo) {
		if(unEquipo.algunIntegrantePuedeBloquearA(self)) {
			const rivalQueBloquea = unEquipo.elPrimerIntegranteQuePuedeBloquearA(self)
			self.perderPuntosDeSkills(2)
			rivalQueBloquea.ganarPuntosDeSkills(10)
		}
		else {
			equipo.ganarPuntos(10)
			self.ganarPuntosDeSkills(5)
		}
			
	}
}

class Guardian inherits Jugador {
	override method habilidad() = super() + nivelDeReflejo + fuerza
	
	override method puedeBloquearA(unJugador) = (1..3).anyOne().equals(3)
	
	override method esBlancoUtil() = not equipo.tieneLaQuaffle()
	
	override method jugarContra(unEquipo) {
		
	}
}

class Golpeador inherits Jugador {
	var blanco
	
	override method habilidad() = super() + punteria  + fuerza
	
	override method puedeBloquearA(unJugador) = self.esGroso()
	
	override method esBlancoUtil() = false
	
	override method jugarContra(unEquipo) {
		self.elegirBlancoDe(unEquipo)
		
		if(self.puedeGolpearAlBlanco())
		blanco.serGolpeadoPorUnaBludger()
		self.ganarPuntosDeSkills(1)
	}
	
	method elegirBlancoDe(unEquipo) {
		blanco = unEquipo.cualquierIntegrante()
	}
	
	method puedeGolpearAlBlanco() = punteria > blanco.nivelDeReflejo() or (1..10).anyOne() >= 8
}

class Buscador inherits Jugador {
	var estaBuscando = true
	var cantidadDeTurnosContinuosBuscando = 0
	var kilometrosRecorridos = 0
	
	method estaBuscandoLaSnitch() = estaBuscando
	
	override method habilidad() = super() + nivelDeReflejo * nivelDeVision
	
	override method puedeBloquearA(unJugador) = false
	
	override method esBlancoUtil() = self.estaBuscandoLaSnitch() or self.leFaltanMenosDe1000Kilometros()
	
	method intentarObtenerLaSnitch() {
		if (estaBuscando) {
			if((1..1000).anyOne() < self.habilidad() + cantidadDeTurnosContinuosBuscando)
				self.encontrarSnitch()
		}
		else
			self.perseguirSnitch()
	}
	
	method perseguirSnitch() {		
		if (self.alcanzaSnitch()) {
			self.encontrarSnitch()
			kilometrosRecorridos = 0
			self.ganarPuntosDeSkills(10)
			equipo.ganarPuntos(150)
		}
		else
			kilometrosRecorridos = (kilometrosRecorridos + self.velocidad() / 1.6).min(5000)
	}
	
	method leFaltanMenosDe1000Kilometros() = 5000 - kilometrosRecorridos < 1000
	
	method alcanzaSnitch() = kilometrosRecorridos == 5000
	
	method encontrarSnitch() {
		estaBuscando = false
	}
	
	method reiniciarBusqueda() {
		cantidadDeTurnosContinuosBuscando += 1
		estaBuscando = true
	}
	
	override method jugarContra(unEquipo) {
		self.intentarObtenerLaSnitch()
		
	}
	
	override method serGolpeadoPorUnaBludger() {
		super()
		self.reiniciarBusqueda()
	}
}