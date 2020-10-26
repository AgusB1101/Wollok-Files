import Carpeta.*
import Archivo.*
import Cambio.*

class Commit {
	var descripcion
	const cambiosARealizar = []
	
	method realizarCambios(unaCarpeta) {
		cambiosARealizar.forEach({unCambio => unCambio.ejecutarse(unaCarpeta)})
	}
	
	method descripcion() = descripcion
	
	method afectaA(unArchivo) = cambiosARealizar.any({cambio => cambio.archivo().nombre() == unArchivo})
}