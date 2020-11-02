object reboteador {
	var habilidad
	method habilidad(jugador) {
		habilidad = (jugador.altura() * 2 + ( jugador.nivelDeInteligencia() - jugador.talentoDeManejo()) / 3 ) / 5
		if (jugador.esSucio()) return habilidad + (habilidad * 0.2).abs()
		else return habilidad
	}
	
	method cansancioPorEntrenamiento() = 8
}

object pasador {
	method habilidad(jugador) {
		return ((jugador.nivelDeInteligencia() + jugador.talentoDeManejo()) / 2 + jugador.altura() * 0.80 + jugador.eficaciaTriples() * 0.30) / 5
	}
	
	method cansancioPorEntrenamiento() = 5
}

object tirador{
	var habilidad
	method habilidad(jugador) {
		habilidad = (jugador.eficaciaTriples() * 2 + ( jugador.nivelDeInteligencia() + jugador.talentoDeManejo()) / 2 + jugador.altura() / 2) / 2
		if (jugador.esSucio()) return habilidad - (habilidad * 0.15).abs()
		else return habilidad
	}
	
	method cansancioPorEntrenamiento() = 3
}