import Jugador.*
import Entrenador.*
import Estilo.*

class Equipo {
	const property jugadores = []
    var property entrenador

    method agregarJugador(jugador) {
        jugadores.add(jugador)
    }
    method dreamTeam() {
        return jugadores.any({jugador => jugador.esLeyenda()})
    }

    method valoracionTotal() = self.valoracionSinBonificacion() + self.valoracionSinBonificacion()* entrenador.multiplicadorDeHabilidad() + self.bonoSuciedad()
    

    method valoracionSinBonificacion() = jugadores.sum({jugador => jugador.habilidad()}) / jugadores.size()

    method bonoSuciedad() {
        var bonifSuciedad = 0
    	const estadoPrimerJugador = jugadores.first().esSucio()
        const todosCompartenEstado = jugadores.all({jugador => jugador.esSucio() == estadoPrimerJugador})

        if(todosCompartenEstado)
              bonifSuciedad = 10

          return bonifSuciedad
    }
    
    method hacerTodos(unEstilo) {
    	jugadores.forEach({unJugador => unJugador.estiloJugador(unEstilo)})
    }
    
    method entrenarATodos() {
    	jugadores.forEach({unJugador => entrenador.entrenar(unJugador)})
    }
    
    method esDeAltoRendimiento()  = jugadores.all({unJugador => unJugador.siSeCansaDisminuyeSuStaminaMenosDe(4)})
    
    method esMedioPelo() = self.valoracionSinBonificacion() < 75
    
    method tienenAlgunaLeyenda() = jugadores.any({unJugador => unJugador.esLeyenda()})
}

object equipoPdep inherits Equipo (jugadores = [juan, franco, aye]){
}

object losLakers inherits Equipo (jugadores = [lebron, aye, juan]){
}