class Adorno {
	const pesoBase
	const property coeficienteDeSuperioridad
	
	method peso() = pesoBase
	
	method importancia() = self.peso() * coeficienteDeSuperioridad
}

class Luz inherits Adorno {
	const cantidadDeLuces
	
	method luminosidad() = cantidadDeLuces
	
	override method importancia() = super() * self.luminosidad()
}

class FiguraElaborada inherits Adorno {
	const property volumenDeFigura
	
	override method importancia() = super() + volumenDeFigura
}

class Guirnalda inherits Adorno {
	const anioEnQueFueComprada
	
	method cantidadDeAniosEnUso() = (new Date()).year() - anioEnQueFueComprada
	
	override method peso() = pesoBase - 100 * self.cantidadDeAniosEnUso()
}