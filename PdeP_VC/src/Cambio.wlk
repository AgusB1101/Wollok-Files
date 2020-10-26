import Carpeta.*
import Archivo.*

class Cambio {
	const property archivo
	
	method ejecutarse(unaCarpeta){
		if(self.sePuedeRealizarElCambio(unaCarpeta))
			self.realizarCambio(unaCarpeta)
		else
			throw new Exception(message = 'No se pudo realizar el cambio sobre el archivo: "' + archivo + '"')
	}
	
	method sePuedeRealizarElCambio(unaCarpeta) = unaCarpeta.contieneArchivo(archivo)
	method realizarCambio(unaCarpeta)
	method realizarOpuesto(unaCarpeta)
}

class Crear inherits Cambio {
	
	override method sePuedeRealizarElCambio(unaCarpeta) = not super(unaCarpeta)
	
	override method realizarCambio(unaCarpeta) {
		unaCarpeta.agregarArchivo(new Archivo(nombre = archivo, contenido = ""))
	}
	
	override method realizarOpuesto(unaCarpeta) {
		const cambioOpuesto = new Eliminar(archivo = archivo)
		cambioOpuesto.ejecutarse(unaCarpeta)
	}
}

class Eliminar inherits Cambio {
	override method realizarCambio(unaCarpeta) {
		unaCarpeta.eliminarArchivo(archivo)
	}
	
	override method realizarOpuesto(unaCarpeta) {
		const cambioOpuesto = new Crear(archivo = archivo)
		cambioOpuesto.ejecutarse(unaCarpeta)
	}
}

class Agregar inherits Cambio {
	const contenido
	
	override method realizarCambio(unaCarpeta) {
		unaCarpeta.agregarContenidoA(archivo, contenido)
	}
	
	override method realizarOpuesto(unaCarpeta) {
		const cambioOpuesto = new Sacar(archivo = archivo, contenido = contenido)
		cambioOpuesto.ejecutarse(unaCarpeta)
	}
}

class Sacar inherits Cambio {
	const contenido
	
	override method realizarCambio(unaCarpeta) {
		unaCarpeta.sacarContenidoA(archivo, contenido)
	}
	
	override method realizarOpuesto(unaCarpeta) {
		const cambioOpuesto = new Agregar(archivo = archivo, contenido = contenido)
		cambioOpuesto.ejecutarse(unaCarpeta)
	}
}