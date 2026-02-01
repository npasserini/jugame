// import wollok.game.*
import config.*
import directions.*
import objects.*

object snake {
  var property position = game.at((TAMANIO_X-1)/2, (TAMANIO_Y-1)/2)
  var property direction = right
  var property isAlive = true

  method image() = "head.png"

  method eat(apple) {
    apple.reposition()
    game.addVisual(body)
    body.position(self.position())
  }

  method move() {
    if (isAlive) position = direction.next(position)  
  }

  method stop() {
    isAlive = false
  }

  method start() {
    position = game.at((TAMANIO_X-1)/2, (TAMANIO_Y-1)/2)
    isAlive = true
  }
}

object body {
  var property position = util.randomPosition()
  method image() = "snake.png"
}