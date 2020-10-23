class Ciudad {
	
	const property objetos = []
	var temperatura = 0
	
	method bajarTemperatura(unosGrados) {
		temperatura -= unosGrados
	}
	
	method temperatura() = temperatura
	
	method agregarObjeto(unObjeto) {
		objetos.add(unObjeto)
	}
	
	method perder(unObjeto) {
		if(not objetos.contains(unObjeto))
			throw new Exception(message = "La ciudad no posee el objeto.")
		else
			objetos.remove(unObjeto)
	}
}
