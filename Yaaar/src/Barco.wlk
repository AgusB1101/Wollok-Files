import Pirata.*
import CiudadCostera.*
import Mision.*

class Barco{
	var mision
	const capacidad
	const property tripulacion = []
	const itemsDePasadosDeGrogXD = #{}
	
	//Punto 2
	
	//2.a.
	
	method puedeFormarParteDeTripulacion(unPirata) = mision.esUtil(unPirata) and self.cantidadDeTripulacion() < capacidad
	
	//2.b.
	
	method incorporarATripulacion(unPirata) {
		if(self.puedeFormarParteDeTripulacion(unPirata))
			tripulacion.add(unPirata)
		else
			throw new Exception(message = "No se puede incorporar a la tripulación")
	}
	
	//2.c.
	
	method cambiarMision(unaMision) {
		mision = unaMision
		tripulacion.removeAllSuchThat({tripulante => not mision.esUtil(tripulante)})
	}
	
	method tieneSuficienteTripulacion() = tripulacion.size() >= 0.9 * capacidad
	
	method algunTripulanteTiene(unItem) = tripulacion.any({tripulante => tripulante.tieneItem(unItem)})
	
	method cantidadDeTripulacion() = tripulacion.size()
	
	method seAnimaASaquear(unPirata) = unPirata.estaPasadoDeGrogXD()
	
	method esVulnerableContra(otroBarco) = self.cantidadDeTripulacion() <= otroBarco.cantidadDeTripulacion() / 2
	
	method todaLaTripulacionEstaPasadaDeGrogXD() = tripulacion.all({tripulante => tripulante.estaPasadoDeGrogXD()})
	
	//Punto 3
	
	//3.a.
	
	method elTripulanteMasEbrio() = tripulacion.max({tripulante => tripulante.nivelDeEbriedad()})
	
	//3.b.
	
	method anclarEn(unaCiudadCostera) {
		const tripulanteMasEbrio = self.elTripulanteMasEbrio()
		
		self.hacerQueTripulacionTomeGrogXD()
		self.perderTripulante(tripulanteMasEbrio)
		unaCiudadCostera.sumarHabitante()
	}
	
	//Punto 4
	
	//4.a.
	
	method esTemible() = mision.puedeRealizarla(self)
	
	method hacerQueTripulacionTomeGrogXD() {
		tripulacion.forEach({tripulante => tripulante.tomarGrogXD()})
	}
	
	method perderTripulante(unTripulante) {
		tripulacion.remove(unTripulante)
	}
	
	method tripulantesPasadosDeGrogXD() = tripulacion.filter({tripulante => tripulante.estaPasadoDeGrogXD()})
	
	method todosEstanPasadosDeGrogXD() = self.cuantosTripulantesEstanPasadosDeGrogXD() == self.cantidadDeTripulacion()
	
	//Punto 5
	
	//5.a.
	
	method cuantosTripulantesEstanPasadosDeGrogXD() = self.tripulantesPasadosDeGrogXD().size()
	
	//5.b.  (Falta agregar items al Set)
	
	method cantidadDeItemsDePasadosDeGrogXD() = itemsDePasadosDeGrogXD.size()
	
	//5.c.
	
	method tripulantePasadoDeGrogXDConMasDinero() = self.tripulantesPasadosDeGrogXD().max({tripulante => tripulante.cantidadDeMonedas()})

	// Falta Punto 6
}