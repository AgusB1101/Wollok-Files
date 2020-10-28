import Arma.*
import Persona.*
import Traicion.*

class Familia {
	const property miembros = #{}
	const property traiciones = []
	
	const elDon = {unMiembro => unMiembro.esDon()}
	
	method agregarMiembro(unaPersona) {
		if(self.tieneDon() and unaPersona.esDon())
			throw new Exception(message = "Solo puede haber un solo Don por familia")
		else
			miembros.add(unaPersona)
	}
	
	method perderMiembro(unaPersona) {
		miembros.remove(unaPersona)
	}
	
	method matarA(unTraidor) {
		unTraidor.morir()
		self.perderMiembro(unTraidor)
	}
	
	method cantidadDeMiembros() = miembros.size()
	
	method tieneDon() = miembros.any(elDon)
	
	method donDeFamilia() = miembros.find(elDon)
	
	method perderDon() {
		const donDeFamilia = self.donDeFamilia()
		self.perderMiembro(donDeFamilia)
	}
	
	method lealtadTotal() = miembros.sum({unMiembro => unMiembro.lealtad()})
	
	method lealtadPromedio() = self.lealtadTotal() / self.cantidadDeMiembros()
	
	method aumentarPorcentajeDeLealtad(unPorcentaje) {
		miembros.forEach({unMiembro => unMiembro.aumentarPorcentajeDeLealtad(unPorcentaje)})
	}
	
	method subirRangos() {
		miembros.forEach({unMiembro => unMiembro.subirDeRango()})
	}

	method estaDurmiendoConLosPeces(unaPersona) = not unaPersona.estaVivo()
	
	method familiaresVivos() = miembros.filter({unMiembro => unMiembro.estaViva()})
	
	method elMasPeligroso() = self.familiaresVivos().max({unMiembro => unMiembro.cantidadDeArmas()})
	
	method darRevolverCon6BalasA(unMiembro) {
		unMiembro.agregarArma(new Revolver(balas = 6))
	}
	
	method elMiembroMasLeal() = miembros.max({unMiembro => unMiembro.lealtad()})
	
	method esElMasLeal(unMiembro) = self.elMiembroMasLeal().equals(unMiembro)
	
	method elQueQuieraEstarArmadoQueEsteArmado() {
		miembros.forEach({unMiembro => self.darRevolverCon6BalasA(unMiembro)})
	}
	
	method esElegante(unMiembro) = unMiembro.sabeDespacharElegantemente()
	
	method ataqueSorpresaA(unaFamilia) {
		const elMasPeligroso = unaFamilia.elMasPeligroso()
		
		miembros.forEach({unMiembro => unMiembro.atacarA(elMasPeligroso)})
	}
	
	method luto() {
		self.perderDon()
		self.aumentarPorcentajeDeLealtad(10)
		self.subirRangos()
	}
	
	method registrarTraicion(unaTraicion) {
		traiciones.add(unaTraicion)
	}
}
