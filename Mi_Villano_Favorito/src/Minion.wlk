import Color.*
import Arma.*

class Minion {
	var color = amarillo
	var cantidadDeBananas
	const property armas = []
	
	method color() = color
	
	method perdeUnaBanana(){
		cantidadDeBananas -= 1
	}
	
	method cantidadDeBananas() {
		return cantidadDeBananas
	}
	
	method tomarSuero() {
		color.tomarSuero(self)
	}
	
	method cambiarColorA(unColor) {
		color = unColor
	}
	
	method perdeTodasLasArmas() {
		armas.clear()
	}
	
	method esPeligroso() = color.esPeligroso(self)
	
	method tieneMasDeDosArmas() = armas.size() > 2
	
	method agregarArma(unArma) {
		armas.add(unArma)
	}
	
	method nivelDeConcentracion() = color.nivelDeConcentracion(self)
	
	method potenciaDelArmaMasPotente() = self.armaMasPotente().potencia()
	
	method armaMasPotente() = armas.max({arma => arma.potencia()})
	
	method comerBananas(unasBananas) {
		cantidadDeBananas += unasBananas
	}
	
	method estaCapacitado(unaMaldad) = unaMaldad.puedeParticipar(self)
	
	method tieneArma(unNombreDeArma) = armas.any({arma => arma.nombre().equals(unNombreDeArma)})
	
	method tieneNivelDeConcentracionMayorA(unValor) = self.nivelDeConcentracion() > unValor
	
	method tieneCantidadDeBananasMayorA(unValor) = cantidadDeBananas > unValor
}