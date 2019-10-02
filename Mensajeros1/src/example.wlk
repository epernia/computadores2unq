class Paquete {
	var property pago = false

	method podesSerEntregado(unMensajero, unLugar) {
		return pago && unLugar.puedeLlegar(unMensajero)
	}
}


class Neo {
	var property credito = true
	
	constructor( unBool ) {
		credito = unBool
	}

	method puedeLlamar() {
		return credito
	}

	method peso() {
		return 0
	}

}

class Chuck {
	method peso() {
		return 900
   }
	method puedeLlamar() {
		return true
	}
}




/*
 * Mensajeros
 */
class Hawk {

	var property peso = 80 
	var property transporte = new Bicicleta()
        
   constructor( unTransporte ) {
		transporte = unTransporte
    }
    method peso() {
		return peso + transporte.peso()
    }

	method puedeLlamar() {
		return false
	}

}

/*
 * Camion hereda vehículo con todo, variables, métodos y 
 * constructores.
 */
class Camion {

	var property cantAcoplados = 0
	
	constructor(cant) {
		cantAcoplados = cant
	}

	method peso() {
		return 500 + cantAcoplados * 500
	}

}

/*
 * Si "nos alcanza" con las variables y los métodos que ya
 * tiene Vehiculo no tenemos que hacer nada. No está mal que 
 * la clase quede vacía, por si en un futuro le queremos agregar
 * algo como por ejemplo rodado de la bicicleta, cantidad de cambios,
 * capacidad de la caja de carga, etc.
 */
class Bicicleta {
   method peso(){
      return 10
   }
}

/*
 * Lugares
 */
class Brooklyn {
	method puedeLlegar(unMensajero) {
		return unMensajero.peso() <= 1000   		 		
   }
}

class Matrix {
	method puedeLlegar(unMensajero) {
		return unMensajero.puedeLlamar()
	}
}

