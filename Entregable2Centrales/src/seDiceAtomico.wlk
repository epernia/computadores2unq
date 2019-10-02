object springfield{
   var property necesidadEnergetica = 500
   const property velocidadDelViento = 10 // m/s
   const centrales = #{centralAtomicaBurns, centralDeCarbonExBosque, centralEolicaElSuspiro}
   // #{} == new Set() ; [] == new List()
   method riquezaDelSuelo(){
      return 0.9 // 90%
   }
   method agregarCentral( unaCentral ){
      centrales.add(unaCentral)
   }
   method removerCentral( unaCentral ){
      centrales.remove(unaCentral)
   }   
   method produccionEnergeticaDe( unaCentral ) {
      return unaCentral.produccionEnergeticaEn( self )
   }   
   method cubreSusNecesidades(){
      return necesidadEnergetica < self.produccionTotalDeLasCentrales( centrales )
   }
   method produccionTotalDeLasCentrales( unasCentrales ){
      return unasCentrales.sum( {e => e.produccionEnergeticaEn(self) } )
   }
   method centralesContaminantes(){
      return centrales.filter( { e => e.contamina() } )      
   }   
   method estaAlHorno(){
      return self.centralesContaminantesAportanMasDel50() ||
             self.todasContaminan()
   }
   method centralesContaminantesAportanMasDel50(){
      return self.produccionTotalDeLasCentrales( self.centralesContaminantes() ) > 
             (necesidadEnergetica / 2.0)
   }
   method todasContaminan(){
      return centrales.all( { e => e.contamina() } )
   }
   method centralMasProductora()
   {
      return centrales.max( { e => e.produccionEnergeticaEn(self) } )
   }
}

object centralAtomicaBurns{
   var varillas = 10
   method produccionEnergeticaEn( unaCiudad ) {
      return varillas * 0.1
   }   
   method contamina(){
      return varillas > 20
   }
}

object centralDeCarbonExBosque{
   var property toneladasDeCarbon = 10
   method produccionEnergeticaEn( unaCiudad ) {
      return toneladasDeCarbon * unaCiudad.riquezaDelSuelo() + 0.5
   }   
   method contamina(){
      return true
   }
}

object centralEolicaElSuspiro{
   const turbinas = #{ new Turbina(0.2) }
   method agregarTurbinaConProduccion( produccion ){
      turbinas.add( new Turbina(produccion) )
   }
   method produccionEnergeticaEn( unaCiudad ) {
      return unaCiudad.velocidadDelViento() * self.produccionTotalDeLasTurbinas( unaCiudad )
   }
   method produccionTotalDeLasTurbinas( unaCiudad ) {
      return turbinas.sum( { e => e.produccion() } )
   }
   method contamina(){
      return false
   }
}

class Turbina{
   var property produccion = 0.2
   constructor( unValorDeProduccion ){
      produccion = unValorDeProduccion
   }
}


object centralHidoelectrica{
   method produccionEnergeticaEn( unaCiudad ) {
      return 2 * unaCiudad.caudalDelRio()
   }
   method contaminacion() {
      return false
   }
}

object albuquerque{
   const property caudalDelRio = 150
   const central = centralHidoelectrica
   method centralMasProductora()
   {
      return central
   }
}

object region{
   const ciudades = #{ springfield, albuquerque }
   /* 5. Se agrega la ciudad de Albuquerque a la región en donde estaba Springfield. Albuquerque tiene un río de caudal 150 l/s, y espacio para poner sólo una central. En estos momentos, la misma es una central hidroeléctrica.

   6. Conocer las centrales más productoras de la región, sabiendo que la central hidroeléctrica produce 2 millones de kWh * el caudal del río. En otras palabras, se necesita de cada ciudad de la región obtener la central que más kWH produce. */

   method centralesMasProductoras()
   {
      return ciudades.map( { unaCiudad => unaCiudad.centralMasProductora() } )
   }
   
}






/* 2. Se desean conocer las centrales contaminantes de Springfield. */

//springfield.centralesContaminantes() 
//   ---> Retorna unSet de centrales que contaminan

/* 3. Se desea saber si Springfield cubrió sus necesidades con su suministro. */

//springfield.cubreSusNecesidades() 
//   ---> Retorna unBooleano

/* 4. Springfield necesita saber si está en el horno. Está en el horno cuando las centrales contaminantes aportan más del 50% de lo necesario, ó si todas las centrales son contaminantes. */

//springfield.estaAlHorno() 
//   ---> Retorna unBooleano

//=============================================================================

/* 1. Se desea saber la producción energética de una central en Springfield. */

//springfield.produccionEnergeticaDe( unaCentral ) 
//   ---> Retorna unNumero

/* 2. Se desean conocer las centrales contaminantes de Springfield. */

//springfield.centralesContaminantes() 
//   ---> Retorna unSet de centrales que contaminan

/* 3. Se desea saber si Springfield cubrió sus necesidades con su suministro. */

//springfield.cubreSusNecesidades() 
//   ---> Retorna unBooleano

/* 4. Springfield necesita saber si está en el horno. Está en el horno cuando las centrales contaminantes aportan más del 50% de lo necesario, ó si todas las centrales son contaminantes. */

//springfield.estaAlHorno() 
//   ---> Retorna unBooleano

//Internamente conviene modularizar este método en 2 métodos que calculen ambas condiciones y luego se realice || (or) entre estos.

/* 5. Se agrega la ciudad de Albuquerque a la región en donde estaba Springfield. Albuquerque tiene un río de caudal 150 l/s, y espacio para poner sólo una central. En estos momentos, la misma es una central hidroeléctrica.

6. Conocer las centrales más productoras de la región, sabiendo que la central hidroeléctrica produce 2 millones de kWh * el caudal del río. En otras palabras, se necesita de cada ciudad de la región obtener la central que más kWH produce. */

//  region.centralesMasProductoras()

//   ---> Retorna unSet que contiene la central que más produce de springfield y la que más produce de albuquerque (la única que tiene, la hidroeléctrica).

