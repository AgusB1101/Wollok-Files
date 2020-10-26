class Branch {
	const property commits = []
	
	method checkout(unaCarpeta){
		commits.forEach({commit => commit.realizarCambios(unaCarpeta)})
	}
	
	method log(unArchivo) = commits.filter({commit => commit.afectaA(unArchivo)})
}
