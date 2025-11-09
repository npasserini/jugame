// import wollok.game.*
import config.*
object snake {
  var property position = game.at((TAMANIO_X-1)/2, (TAMANIO_Y-1)/2)

  method image() = "head.png"
}

object apple {
  var property position = game.at(0, 3)
  
  method image() = "apple.png"
}