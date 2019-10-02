class Persona{
   var property celular
   var property empresa
   var deuda = 0
   constructor( cel, emp ){
      celular = cel
      empresa = emp
   }
   method llamarA( unaPersona, duracion ){
      celular.llamada( duracion )
      empresa.cobrar( self, duracion )
      unaPersona.llamadaRecibidaDe( duracion )
   }
   method llamadaRecibidaDe( duracion ){
      celular.llamada( duracion )
   }   
   // Saber si tiene el celular apagado
   method celularApagado(){
      return celular.estaApagado()
   }
   method cobrar( unMonto ){
      return deuda = deuda + unMonto
   }
}

class Celular{
   var bateria = 5.0
   // Conocer la cantidad de batería de cada celular.
   method bateria(){
      return bateria
   }
   // Saber si un celular está apagado (si está sin batería).
   method estaApagado(){
      return bateria <= 0.0
   }
   // Recargar un celular (que vuelva a tener su batería completa).
   method recargar(){
      bateria = 5.0
   }
}

class SamsungS9 inherits Celular{
   // Samsung Galaxy S9 pierde 0,25 "puntos" de batería por cada llamada
   method llamada( duracion ){
      bateria = bateria - 0.25
   }
}

class IphoneX inherits Celular{
   // iPhone X pierde 0,1% de la duración de cada llamada en batería.
   method llamada( duracion ){
      bateria = bateria - duracion * 0.01
   }
}

object movistar{
   // Movistar cobra fijo $0,60 final el minuto
   method cobrar( unaPersona, duracion ){
      unaPersona.cobrar( 0.6 * duracion )
   }
}

object claro{
   // Claro cobra 0,50 el minuto + 21% de IVA
   method cobrar( unaPersona, duracion ){
      unaPersona.cobrar( (0.5 * duracion) * 1.21 )
   }
}

object personal{
   // Personal $0,70 final los primeros 10 minutos que usaste el celu, y $0,40 el minuto el resto. 
   method cobrar( unaPersona, duracion ){      
      if( duracion > 0.0 && duracion <= 10.0 ){
         unaPersona.cobrar(0.7 * duracion)
      } else if( duracion > 10.0 ){
         unaPersona.cobrar( (0.4 * (duracion - 10.0)) + 7.0 )
      }
   }
}


----------------------------------------------

const s9 = new SamsungS9()
const iphoneX = new IphoneX()

const juliana = new Persona(s9, personal)
const catalina = new Persona(iphoneX, movistar)

juliana.llamarA( catalina, 2 )







