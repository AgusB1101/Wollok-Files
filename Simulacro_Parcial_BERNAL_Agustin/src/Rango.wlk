import Persona.*
import Arma.*

class Rango {
	method armas() = []
	method atacar(unaPersona, unaVictima)
	method sabeDespacharElegantemente(unaPersona)
	method esDon() = false
}

class Don inherits Rango{	
	const property subordinados = #{}

	method algunoDeSusSubordinados() = subordinados.anyOne()
	
	override method atacar(unaPersona, unaVictima) {
		self.algunoDeSusSubordinados().atacarUnaCantidadDeVeces(unaVictima, 2)
	}
	
	override method sabeDespacharElegantemente(unaPersona) = true
	
	override method esDon() = not super()
}

class Subjefe inherits Rango{
	const property subordinados = #{}
	
	override method atacar(unaPersona, unaVictima){
		unaPersona.utilizarArmaContra(unaVictima)
	}
	
	method utilizarArma(unaPersona, unaVictima) {
		const armaDistinta = unaPersona.unArmaDistinta()
		armaDistinta.utilizarContra(unaVictima)
	}
	
	override method sabeDespacharElegantemente(unaPersona) {
		return subordinados.any({unSubordinado => unSubordinado.tieneArmaSutil()})
	}
	
	method puedeSubirDeRango(unaPersona) = unaPersona.esElMasLeal()
	
	method subirRango(unaPersona) = unaPersona.rango(new Don(subordinados = subordinados))
}

object soldado inherits Rango{
	
	override method armas() = [escopeta]
	
	override method atacar(unaPersona, unaVictima){
		unaPersona.utilizarArmaContra(unaVictima)
	}
	
	method utilizarArma(unaPersona, unaVictima) {
		const armaMasAMano = unaPersona.armaMasAMano()
		armaMasAMano.utilizarContra(unaVictima)
	}
	
	override method sabeDespacharElegantemente(unaPersona) = unaPersona.tieneArmaSutil()
	
	method puedeSubirDeRango(unaPersona) = unaPersona.cantidadDeArmasMayorA(5)
	
	method subirRango(unaPersona) = unaPersona.rango(new Subjefe())
}
