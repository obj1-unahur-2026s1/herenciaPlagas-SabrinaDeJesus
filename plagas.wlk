import elementos.*

class Plaga {
    var poblacion

    method transmiteEnfermedades() = poblacion  >= 10 && self.condicionAdicional()
    method condicionAdicional()
    method nivelDeDanio()
    method atacar(elemento) {
        elemento.recibirAtaqueDe(self)
        poblacion = poblacion * 1.1
    }
}

class Cucarachas inherits Plaga {
    var pesoPromedio

    override method nivelDeDanio() = poblacion * 0.5
    override method condicionAdicional() = pesoPromedio >= 10
    override method atacar(elemento) {
        super(elemento)
        pesoPromedio += 2
    }
}

class Pulgas inherits Plaga {
    override method nivelDeDanio() = poblacion * 2
    override method condicionAdicional() = true
}

class Garrapatas inherits Pulgas {
    override method atacar(elemento) { elemento.recibirAtaqueDe(self); poblacion = poblacion * 1.2 }
}

class Mosquitos inherits Plaga {
    override method nivelDeDanio() = poblacion
    override method condicionAdicional() = poblacion % 3 == 0
}