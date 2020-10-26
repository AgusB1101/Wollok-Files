import Pirata.*
import Barco.*
import CiudadCostera.*

//Punto 1

class Mision {
	method puedeRealizarla(unBarco) = unBarco.tieneSuficienteTripulacion()
	method esUtil(unTripulante)
}

object busquedaDelTesoro inherits Mision {
	
	override method esUtil(unTripulante) {
		const itemsRequeridos = ["Brújula", "Mapa", "Botella de GrogXD"]
		
		return itemsRequeridos.any({item => unTripulante.tieneItem(item)}) and unTripulante.tieneCantidadDeMonedasMenorA(5)
	} 
	
	override method puedeRealizarla(unBarco) = super(unBarco) and unBarco.algunTripulanteTiene("Llave de Cofre")
}

class ConvertirseEnLeyenda inherits Mision {
	const itemObligatorio
	
	override method esUtil(unTripulante) = unTripulante.cantidadDeItems() > 10 and unTripulante.tieneItem(itemObligatorio) 
}

class Saqueo inherits Mision {
	const property victima
	var property cantidadDeMonedas
	
	override method esUtil(unTripulante) = unTripulante.tieneCantidadDeMonedasMenorA(cantidadDeMonedas) and unTripulante.seAnimaASaquearA(victima)
	
	override method puedeRealizarla(unBarco) = super(unBarco) and victima.esVulnerableContra(unBarco)
}