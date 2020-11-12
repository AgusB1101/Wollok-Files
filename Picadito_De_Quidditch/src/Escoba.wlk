class Nimbus {
	const property anioDeFabricacion
	
	var porcentajeDeSalud = 100
	
	method cantidadDeAniosDeFabricacion() = new Date().year() - anioDeFabricacion
	
	method velocidad() = (80 - self.cantidadDeAniosDeFabricacion()) * porcentajeDeSalud / 100
	
	method recibirGolpe() {
		self.perderSalud(10)
	}
	
	method perderSalud(unPorcentaje) {
		porcentajeDeSalud = (porcentajeDeSalud - unPorcentaje).max(0)
	}
	
}

object saetaDeFuego {
	const property velocidad = 100 
	
	method recibirGolpe() {
		
	}
}