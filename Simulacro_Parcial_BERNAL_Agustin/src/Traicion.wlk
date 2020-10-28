import Persona.*
import Rango.*
import Familia.*

class Traicion {
	const property familiaNueva
	const property victimas = #{}
	var fechaTentativa
	
	method fechaTentativa() = fechaTentativa
	
	method adelantarDias(unosDias) {
		fechaTentativa = fechaTentativa.minusDays(unosDias)
	}
	
	method agregarVictima(unaVictima) {
		victimas.add(unaVictima)
	}
	
	method adelantarFechaYAgregarVictima(unosDias, unaVictima) {
		self.adelantarDias(unosDias)
		self.agregarVictima(unaVictima)
	}
	
	method laPuedeRealizar(unTraidor) {
		const familiaATraicionar = unTraidor.familia() 
		
		return familiaATraicionar.lealtadPromedio() < 2 * unTraidor.lealtad()
	}
	
	method realizarTraicion(unTraidor){
		const familiaATraicionar = unTraidor.familia()
		
		if(self.laPuedeRealizar(unTraidor)) {
			unTraidor.atacarVictimas(victimas)
			unTraidor.cambiarseDeFamiliaA(familiaNueva)
			unTraidor.rango(soldado)
			unTraidor.subirLealtadAlMaximo()
		}
		else
			familiaATraicionar.matarA(unTraidor)
		
		familiaATraicionar.registrarTraicion(self)
	}
}
