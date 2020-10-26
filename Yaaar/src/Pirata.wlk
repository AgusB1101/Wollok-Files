import Barco.*
import CiudadCostera.*

class Pirata {
	var cantidadDeMonedas
	var nivelDeEbriedad
	
	const property items = []
	
	method cantidadDeMonedas() = cantidadDeMonedas
	
	method nivelDeEbriedad() = nivelDeEbriedad
	
	method tieneItem(unItem) = items.contains(unItem)	
	
	method tieneCantidadDeMonedasMenorA(unValor) = unValor > cantidadDeMonedas
	
	method cantidadDeItems() = items.size()
	
	method seAnimaASaquearA(unaVictima) = unaVictima.seAnimaASaquear(self)
	
	method estaPasadoDeGrogXD() = nivelDeEbriedad >= 90
	
	method tieneNivelDeEbriedadMayorA(unValor) = nivelDeEbriedad >= unValor
	
	method aumentarNivelDeEbriedad(unValor) {
		nivelDeEbriedad += unValor
	}
	
	method gastarMoneda() {
		if(cantidadDeMonedas > 0)
			cantidadDeMonedas -= 1
		else
			throw new Exception(message = "No se puede gastar una moneda")
	}
	
	method tomarGrogXD() {
		self.aumentarNivelDeEbriedad(5)
		self.gastarMoneda()
	}
}

//4.b.

class EspiaDeLaCorona inherits Pirata {
	override method estaPasadoDeGrogXD() = false
	
	override method seAnimaASaquearA(unaVictima) = super(unaVictima) and self.tieneItem("Permiso de la Corona")
}