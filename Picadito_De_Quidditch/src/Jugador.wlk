import Escoba.*
import Posicion.*
import Equipo.*
import ValorArbitrario.*

class Jugador {
	const property peso
	const property escoba
	const property equipo
	const property nivelDeReflejo = 0
	const property nivelDeVision = 0
	const property punteria = 0
	const property fuerza = 0
	
	var skills = 0
	
	method skills() = skills
		
	method nivelDeManejoDeEscoba() = skills / peso
	
	method velocidad() = self.nivelDeManejoDeEscoba() * escoba.velocidad()
	
	method habilidad() = self.velocidad() + skills
	
	method lePasaElTrapoA(unJugador) = self.habilidad() >= 2 * unJugador.habilidad()
	
	method esGroso() = self.suHabilidadSuperaElPromedioDelEquipo() and self.suVelocidadSuperaElValorArbitrario()
	
	method suHabilidadSuperaElPromedioDelEquipo() = self.habilidad() > equipo.habilidadPromedio()
	
	method suVelocidadSuperaElValorArbitrario() = self.velocidad() > valorArbitrario.valor()
	
	method esJugadorEstrellaContra(unEquipo) = unEquipo.lePasaElTrapoAlEquipo(self)
	
	method puedeBloquearA(unJugador)
	
	method esBlancoUtil()
	
	method perderPuntosDeSkills(unosPuntos) {
		skills -= unosPuntos
	}
	
	method ganarPuntosDeSkills(unosPuntos) {
		skills += unosPuntos
	}
	
	method serGolpeadoPorUnaBludger() {
		self.perderPuntosDeSkills(2)
		escoba.recibirGolpe()
	}
	
	method jugarContra(unEquipo)
}