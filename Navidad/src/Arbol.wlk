import Tarjeta.*
import Regalo.*
import Adorno.*

class Arbol {
	const property regalos = []
	const property tarjetas = []
	const property adornos = []
	
	method cantidadDeRegalos() = regalos.size()
	
	method capacidadDeRegalos()
	
	method hayCapacidad() = self.cantidadDeRegalos() < self.capacidadDeRegalos()
	
	method agregarRegalo(unRegalo) {
		if (not self.hayCapacidad())
			throw new Exception(message = "No hay más capacidad")
		
		regalos.add(unRegalo)
	}
	
	method agregarTarjeta(unaTarjeta) {
		tarjetas.add(unaTarjeta)
	}
	
	method agregarAdorno(unAdorno) {
		adornos.add(unAdorno)
	}
	
	method beneficiariosDeRegalos() = regalos.map({unRegalo => unRegalo.destinatario()})
	
	method beneficiariosDeTarjetas() = tarjetas.map({unaTarjeta => unaTarjeta.destinatario()})
	
	method beneficiarios() = self.beneficiariosDeRegalos() + self.beneficiariosDeTarjetas()

	method costoDeRegalos() = regalos.sum({unRegalo => unRegalo.precio()})
	
	method costoDeTarjetas() = tarjetas.sum({unaTarjeta => unaTarjeta.precio()})

	method costoTotal() = self.costoDeRegalos() + self.costoDeTarjetas()
	
	method importanciaDeAdornos() = adornos.sum({unAdorno => unAdorno.importancia()})
	
	method regalosTeQuierenMucho() = regalos.filter({unRegalo => unRegalo.esRegaloTeQuierenMucho()})
	
	method cantidadDeRegalosTeQuierenMucho() = self.regalosTeQuierenMucho().size()
	
	method algunaTarjetaTieneValorAdjuntoOMas(unValor) = tarjetas.any({unaTarjeta => unaTarjeta.valorAdjunto() >= unValor})
	
	method esPortentoso() = self.cantidadDeRegalosTeQuierenMucho() > 5 or self.algunaTarjetaTieneValorAdjuntoOMas(1000)
	
	method adornoMasPesado() = adornos.max({unAdorno => unAdorno.peso()})
}

class ArbolNatural inherits Arbol{
	const vejez
	const tamanioDelTronco
	
	override method capacidadDeRegalos() = vejez * tamanioDelTronco
}

class ArbolArtificial inherits Arbol {
	const cantidadDeVaras
	
	override method capacidadDeRegalos() = cantidadDeVaras
}