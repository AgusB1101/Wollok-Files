import Minion.*

object amarillo {
	method tomarSuero(unMinion) {
		unMinion.perdeTodasLasArmas()
		unMinion.perdeUnaBanana()
		unMinion.cambiarColorA(violeta)
	}
	
	method esPeligroso(unMinion) = unMinion.tieneMasDeDosArmas()
	
	method nivelDeConcentracion(unMinion) = unMinion.potenciaDelArmaMasPotente() + unMinion.cantidadDeBananas() 
}

object violeta {
	method tomarSuero(unMinion) {
		unMinion.perdeUnaBanana()
		unMinion.cambiarColorA(amarillo)
	}
	
	method esPeligroso(unMinion) = true
	
	method nivelDeConcentracion(unMinion) = unMinion.cantidadDeBananas()
}