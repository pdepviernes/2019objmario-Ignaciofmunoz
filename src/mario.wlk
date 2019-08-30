import wollok.game.*

object juego {

	method iniciar() {
		game.title("Mario el ahorrista")
		game.width(7)
		game.height(7)
		game.addVisual(peso)
		game.addVisual(unDolar)
		game.addVisual(flor)
		game.addVisual(balanza)
		game.addVisual(mario)
		game.start()
	}

}

object mario {

	var position = game.center()
	var pesosAhorrados = 1

	method levantar(cosa) {
		position = cosa.position()
		pesosAhorrados = pesosAhorrados + cosa.valor()
		game.say(mario, "Junte " + cosa.valor().toString())
		
	}

	method mostrarAhorros() {
		game.say(mario, "Junte " + pesosAhorrados + " pesos.")
	}
	
	method ahorros() = pesosAhorrados
	method nuevoCapital(cantidad){pesosAhorrados+=cantidad}
	
	method image() { return "mario.png"}
	method position() { return position}

}

object peso {

	var valor = 5

	method valor() {return valor}

	method position() {return game.center().right(2)}
	method image() {return "peso.png"}

}

object cajita {

	var valor = 100

	method valor() {return valor}

	//method position() {return game.center().right(2)}
	//method image() {return "peso.png"}

}
object invertir{
	
	method plazoFijo(persona) {
		var ahorros =persona.ahorros() 
		var plata = ahorros *0.02
		persona.nuevoCapital(plata)
	}
	method lebacs(persona,banco){
		var promedio=( persona.ahorros()+banco.capital())/2
		persona.nuevoCapital(promedio*0.1)//entiendo rendimiento como ganancia neta
		
	}
	method bonos(persona){
		var rendimiento=persona.ahorros()*banco.inflacion()
		persona.nuevoCapital(rendimiento)
	}
	
}
	
	

object unDolar {

	method valor() = banco.cotizacion()

	method position() {return game.center().left(2)}
	method image() {return "dolar.png"}

}

object banco {

	var cotizacion = 45
	var capital=183213281
	var inflacion=0.4
method inflacion() {return inflacion}
	method capital() {return capital}
	method cotizacion() {return cotizacion}

	method corrida(){
		cotizacion = 57
		balanza.desbalancear()
	}

	method tranquilidad(){
		cotizacion = 45
		balanza.balancear()
	}

}

object flor {

	method valor() {return 0}

	method position() {return game.center().up(2)}
	method image() {return "flor.png"}

}


object balanza {
	const imagenBalanceada ="balanceado.png" 
	var imagen = imagenBalanceada 
	
	method balancear() { 
		imagen = imagenBalanceada 
	}
	
	method desbalancear() { 
		imagen = "desbalanceado.png"
	}
	
	method position() {return game.center().down(2)}
	method image() {return imagen}
}

