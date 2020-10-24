import Villano.*
import Minion.*

class Piramide {
	const altura
	
	method cumpleRequisitos(unMinion) = unMinion.tieneNivelDeConcentracionMayorA(altura / 2)
	
	method premiarMinions(unVillano, unosMinions) {
		unVillano.dar10BananasAMinions(unosMinions)
	}
}

object sueroMutante {
	method cumpleRequisitos(unMinion) = unMinion.tieneCantidadDeBananasMayorA(100) and unMinion.tieneNivelDeConcentracionMayorA(23)
	
	method premiarMinions(unVillano, unosMinions) {
		unVillano.administrarSueroMutanteAMinions(unosMinions)
	}
}

object laLuna {
	method cumpleRequisitos(unMinion) = unMinion.tieneArma("Rayo Encogedor")
	
	method premiarMinions(unVillano, unosMinions) {
		unVillano.darRayoCongelanteDePotencia10AMinions(unosMinions)
	}
}