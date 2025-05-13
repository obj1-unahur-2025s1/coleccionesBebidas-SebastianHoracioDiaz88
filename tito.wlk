object tito {
    //Variables
    var cantidad = 0
    var bebida = cianuro

    //Consultas
    method peso() = 70
    method inerciaBase() = 490
    method bebida() = bebida
    method velocidad() {
        return bebida.rendimiento(cantidad) * self.inerciaBase() / self.peso()
    }

    //indicacion
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
}

//Bebidas
object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuadoFrutas {
    //leche, frutas, hielo u otros
    const ingredientes = []

    method rendimiento(cantidad) {
        return ingredientes.map({e => e.nutrientes()}).sum() * (cantidad / 1000)
    }

    method agregar(bebidaOIngredientes) {
        ingredientes.add(bebidaOIngredientes)
    }
}

object aguaSaborizada {
    var otraBebida = wisky
    
    method rendimiento(cantidad) {
        return 1 + otraBebida.rendimiento(cantidad) / 4
    }

    method cambiarBebida(unaBebida) {
        otraBebida = unaBebida
    }

    method otraBebida(){
        return 5 + 10
    }
}

object coctel {
    const bebidas = []

    method bebidas() = bebidas

    method rendimiento(cantidad) {
        return bebidas.fold(1, { acumulador, bebida =>
            acumulador * bebida.rendimiento(cantidad)
        })
    }

    method agregar(bebidaOIngredientes) {
        bebidas.add(bebidaOIngredientes)
    }
}

object coctelSuave {
    const bebidas = []

    method rendimiento(cantidad) {
        return bebidas.filter({e => e.rendimiento(cantidad) > 0.5}).sum({e => e.rendimiento(cantidad)})
    }

    method agregar(bebidaOIngredientes) {
        bebidas.add(bebidaOIngredientes)
    }
}

//Ingredientes
object leche {
    method nutrientes() = 10
}

object hielo {
    method nutrientes() = 5
}

object naranja {
    method nutrientes() = 50
}

object piña {
    method nutrientes() = 25
}

object manzana {
    method nutrientes() = 35
}

object banana {
    method nutrientes() = 45
}