/* Ejercicio 2 tom y jerry */

object tom {
	var energia = 1000
	method energiaGanadaPorComer( unAlimento ) {
		return unAlimento.peso() + 12
	}
	method energiaConsumidaPorCorrer( unaDistancia ) {
		return 0.5 * unaDistancia
	}
	method velocidad() {
		return 5 + energia / 10
	}
	method come( unAlimento ) {
		energia = energia + self.energiaGanadaPorComer( unAlimento )
	}
	method correr( unTiempo ) {
		energia = energia - 
		          self.energiaConsumidaPorCorrer( 
						unTiempo * self.velocidad() 
				  	)
	}
	method meConvieneComerA( unAlimento, unaDistancia ) {
		return self.energiaGanadaPorComer( unAlimento ) > 
		       self.energiaConsumidaPorCorrer( unaDistancia )
	}
}

class Raton {
	var property peso = 0
	constructor() {
		peso = 0
	}
	constructor( unObjeto ) {
		peso = unObjeto
	}
	constructor( unObjeto, otroObjeto ) {
		peso = unObjeto
	}
}
	
	
	/*
	override method ==(unRaton){
		return unRaton.peso() == self.peso()
	}
	*/

