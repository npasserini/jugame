// import wollok.game.*
import config.*
import directions.*
import objects.*

object snake {
  var property position = game.at((TAMANIO_X-1)/2, (TAMANIO_Y-1)/2)
  var property direction = right
  var property isAlive = true
  var iHaveEaten = false
  const bodys = []

  method image() = "head.png"

  method eat(apple) {
    apple.reposition()
    iHaveEaten = true
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

      if (iHaveEaten) {
        const body = new Body(position = last)
        bodys.add(body)
        game.addVisual(body)
        iHaveEaten = false
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
  method act() {
    if (snake.isAlive()) {
      game.addVisual(gameOver)
      snake.stop()

      keyboard.space().onPressDo { self.restartGame() }
    }
    
  }
  method restartGame() {
    if (not snake.isAlive()) {
      game.removeVisual(gameOver)
      snake.start() 
    }
  }
}