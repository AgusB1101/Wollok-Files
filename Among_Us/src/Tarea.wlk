class Tarea {
	var tareaRealizada = false
	
	method puedeRealizarTarea(unJugador)
	
	method serRealizadaPor(unJugador) {
		if(self.puedeRealizarTarea(unJugador)) {
			unJugador.informarALaNave()	
			tareaRealizada = true
		}
			
	}
	
	method seRealizo() = tareaRealizada
}

class ArreglarTableroElectrico inherits Tarea {
	override method puedeRealizarTarea(unJugador) = unJugador.tieneItem("Llave Inglesa")
	
	override method serRealizadaPor(unJugador) {
		if(self.puedeRealizarTarea(unJugador)) {
			unJugador.perderItem("Llave Inglesa")
			unJugador.aumentarNivelDeSospecha(10)
		}
			
		super(unJugador)
	}
}

class SacarBasura inherits Tarea {
	override method puedeRealizarTarea(unJugador) = unJugador.tieneItem("Escoba") and unJugador.tieneItem("Bolsa de Consorcio")
	
	override method serRealizadaPor(unJugador) {
		if(self.puedeRealizarTarea(unJugador)) 
			unJugador.perderItem("Escoba")
			unJugador.perderItem("Bolsa de Consorcio")
			unJugador.disminuirNivelDeSospecha(4)
		super(unJugador)
	}
}

class VentilarNave inherits Tarea {
	override method puedeRealizarTarea(unJugador) = true
	
	override method serRealizadaPor(unJugador) {
		unJugador.subirNivelDeOxigenoEnNave(5)
	}
}