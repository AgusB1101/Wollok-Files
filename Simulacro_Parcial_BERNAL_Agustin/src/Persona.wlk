import Familia.*
import Arma.*
import Rango.*
import Traicion.*

class Persona {
	var 		   estaViva   = true
	var 		   estaHerida = false
	var property   rango
	var 		   familia
	var 		   lealtad
	
	const armas      		  = []
	
	method armas() = armas + rango.armas()
	
	method familia() = familia
	
	method cambiarseDeFamiliaA(unaFamilia) {
		familia = unaFamilia
	}
	
	method lealtad() = lealtad
		
	method estaViva() = estaViva
	
	method estaHerida() = estaHerida
	
	method herir() {
		estaHerida = true
	}	
	
	method morir() {
		estaViva = false
	}
		
	method agregarArma(unArma) {
		armas.add(unArma)
	}
	
	method cantidadDeArmas() = armas.size()
	
	method armaMasAMano() = armas.first()
	
	method atacarA(unaVictima) {
		rango.atacar(self, unaVictima)
	}	
	
	method unArmaDistinta() = armas.anyOne()
	
	method atacarUnaCantidadDeVeces(unaVictima, unaCantidadDeVeces) {
		unaCantidadDeVeces.times({_ => self.atacarA(unaVictima)})
	}
	
	method utilizarArmaContra(unaVictima) {
		rango.utilizarArma(self, unaVictima)
	}
	
	method sabeDespacharElegantemente() {
		rango.sabeDespacharElegantemente(self)
	}
	
	method tieneArmaSutil() = armas.any({unArma => unArma.esSutil()})
	
	method esDon() = rango.esDon()
	
	method aumentarPorcentajeDeLealtad(unPorcentaje) {
		lealtad += unPorcentaje
	}
	
	method atacarVictimas(unasVictimas) {
		unasVictimas.forEach({unaVictima => self.atacarA(unaVictima)})
	}
	
	method subirLealtadAlMaximo() {
		lealtad = 100
	}
	
	method esElMasLeal() = familia.esElMasLeal(self)
	
	method cantidadDeArmasMayorA(unValor) = self.cantidadDeArmas() > unValor
	
	method subirDeRango() {
		if(rango.puedeSubirDeRango(self))
			rango.subirRango(self)
	}
	
	method adelantarTraicion(unaTraicion, unosDias, unaVictima) {
		unaTraicion.adelantarFechaYAgregarVictima(unosDias, unaVictima)
	}
	
	method realizarTraicion(unaTraicion) {
		unaTraicion.realizarTraucion(self)
	}
}
