import Equipo.*
import Estilo.*

object fino {
	method multiplicador(unEquipo) {
		var multiplicador = 0
		
		if(unEquipo.esDeAltoRendimiento())
			multiplicador = 0.3
			
		return multiplicador
	}
	
	method modificarEquipo(unEquipo) {
		unEquipo.hacerTodos(tirador)
	}
}

object motivador {
	method multiplicador(unEquipo) {
		var multiplicador = 0
		
		if(unEquipo.esMedioPelo())
			multiplicador = 0.5
			
		return multiplicador
	}
	
	method modificarEquipo(unEquipo) {
		
	}
}

object vendehumo {
	method multiplicador(unEquipo) {
		var multiplicador = - 0.15
		
		if(unEquipo.tienenAlgunaLeyenda())
			multiplicador = 0.25
			
		return multiplicador
	}
	
	method modificarEquipo(unEquipo) {
		
	}
}