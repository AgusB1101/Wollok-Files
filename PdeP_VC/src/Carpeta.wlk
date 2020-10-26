import Archivo.*
import Cambio.*
import Commit.*

class Carpeta {
	const property nombre
	const property archivos = #{}
	
	method contieneArchivo(unArchivo) = archivos.any({archivo => archivo.nombre() == unArchivo})
	
	method agregarArchivo(unArchivo) {
		archivos.add(unArchivo)
	}
	
	method encontrarArchivo(unArchivo) = archivos.find({archivo => archivo.nombre() == unArchivo})
	
	method eliminarArchivo(unArchivo) {
		const archivoARemover = self.encontrarArchivo(unArchivo)
		archivos.remove(archivoARemover)
	}
	
	method agregarContenidoA(unArchivo, unContenido) {
		const archivoACambiar = self.encontrarArchivo(unArchivo)
		archivoACambiar.agregarContenido(unContenido)
	}
	
	method sacarContenidoA(unArchivo, unContenido) {
		const archivoACambiar = self.encontrarArchivo(unArchivo)
		archivoACambiar.sacarContenido(unContenido)
	}
}