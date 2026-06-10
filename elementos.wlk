import plagas.*

class Hogar {
  var nivelDeMugre
  const confort

  method esBueno() = nivelDeMugre <= (confort * 0.5)
  method recibirAtaqueDe(plaga) { nivelDeMugre += plaga.nivelDeDanio() }
}

class Huerta {
  var capacidadDeProduccion

  method esBueno() = capacidadDeProduccion > nivelDeCosechas.valor()
  method recibirAtaqueDe(plaga) { capacidadDeProduccion -= plaga.nivelDeDanio() * 0.1 + if (plaga.transmiteEnfermedad()) 10 else 0 }
}

object nivelDeCosechas {
  var property valor = 10
}

class Mascota {
  var salud

  method esBueno() = salud > 250
  method recibirAtaqueDe(plaga) { if (plaga.transmiteEnfermedad()) salud -= plaga.nivelDeDanio().max(0)}
}

class Barrio {
  //Solo puedo consultar la constante no se va a modificar con el property porque es constante
  const property elementos = []

  method esCopado() = self.cantElementosBuenos() > elementos.size()/2
  method cantElementosBuenos() = elementos.count({ e => e.esBueno() })
}