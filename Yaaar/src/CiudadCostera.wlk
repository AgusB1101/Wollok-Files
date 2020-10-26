import Barco.*
import Pirata.*

class CiudadCostera {
	var cantidadDeHabitantes
	
	method sumarHabitante() {
		cantidadDeHabitantes += 1
	}
	
	method seAnimaASaquear(unPirata) = unPirata.tieneNivelDeEbriedadMayorA(50)
	
	method esVulnerableContra(unBarco) = unBarco.cantidadDeTripulacion() >= 0.4 * cantidadDeHabitantes or unBarco.todosEstanPasadosDeGrogXD()
}
