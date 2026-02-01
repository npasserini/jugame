// import wollok.game.*
import config.*
import directions.*
import objects.*

object snake {
  var property position = game.at((TAMANIO_X-1)/2, (TAMANIO_Y-1)/2)
  var property direction = right
  var property isAlive = true
  const bodys = []

  method image() = "head.png"

  method eat(apple) {
    apple.reposition()
    const body = new Body(position = self.position())
    bodys.add(body)
    game.addVisual(body)
  }

  method move() {
    if (isAlive) {
      var last = position
      position = direction.next(position)
      bodys.forEach { body =>
        const aux = body.position()
        body.position(last)
        last = aux
      }
    }
  }

  method stop() {
    isAlive = false
  }

  method start() {
    position = game.at((TAMANIO_X-1)/2, (TAMANIO_Y-1)/2)
    isAlive = true
    bodys.forEach { body => game.removeVisual(body) }
    bodys.clear()
  }
}

class Body {
  var property position = util.randomPosition()
  method image() = "snake.png"
}