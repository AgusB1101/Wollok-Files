class Revolver {
	var balas
	
	method utilizarContra(unaPersona) {
		balas -= 1
		unaPersona.morir()
	}
	
	method recargar(unasBalas) {
		balas += unasBalas
	}
	
	method esSutil() = balas == 1
}

object escopeta {
	method utilizarContra(unaPersona) {
		if(not unaPersona.estaHerida())
			unaPersona.herir()
		else
			unaPersona.morir()
	}
	
	method esSutil() = false
}

class CuerdaDePiano {
	const esDeBuenaCalidad
	
	method utilizarContra(unaPersona) {
		if (esDeBuenaCalidad)
			unaPersona.morir()
		else
			unaPersona.herir()
	}
	
	method esSutil() = true
}