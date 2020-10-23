import Minion.*
import Arma.*
import Maldad.*
import Ciudad.*
import ObjetosARobar.*

class Villano {
	const property minions = []
	var minionsCapacitados = []
	const rayoCongelanteDePotencia10 = new Arma(nombre = "Rayo Congelante", potencia = 10)
	const property ciudad
	
	method nuevoMinion() {
		minions.add(new Minion(cantidadDeBananas = 5, armas = [rayoCongelanteDePotencia10]))
	}
	
	method otorgarArma(unMinion, unArma) {
		unMinion.agregarArma(unArma)
	}
	
	method darSueroMutante(unMinion) {
		unMinion.tomarSuero()
	}
	
	method alimentar(unMinion, unasBananas) {
		unMinion.comerBananas(unasBananas)
	}
	
	method realizarMaldad(unaMaldad) {
		unaMaldad.realizarMaldad(self, minionsCapacitados, ciudad)
		minionsCapacitados.clear()
	}
	
	method planificarMaldad(unaMaldad) {
		minionsCapacitados = self.buscarMinionsCapacitados(unaMaldad)
		
		if (minionsCapacitados.isEmpty())
			throw new Exception(message = "No hay minions asignados a esta maldad")
	}
	
	method buscarMinionsCapacitados(unaMaldad) {
		return minions.filter({minion => minion.estaCapacitado(unaMaldad)})
	}
	
	method minionsCapacitados() = minionsCapacitados
	
	method dar10BananasAMinions(unosMinions) {
		unosMinions.forEach({minion => self.alimentar(minion, 10)})
	}
	
	method darRayoCongelanteDePotencia10AMinions(unosMinions) {
		unosMinions.forEach({minion => self.otorgarArma(minion, rayoCongelanteDePotencia10)})
	}
	
	method administrarSueroMutanteAMinions(unosMinions) {
		unosMinions.forEach({minion => self.darSueroMutante(minion)})
	}
}