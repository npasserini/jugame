// import wollok.game.*
import config.*
import directions.*

object snake {
  var property position = game.at((TAMANIO_X-1)/2, (TAMANIO_Y-1)/2)
  var property direction = right
  var property isAlive = true

  method image() = "head.png"

  method eat(apple) {
    apple.reposition()
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


object apple {
  var property position = util.randomPosition()
  
  method image() = "apple.png"

  method reposition() {
    position = util.randomPosition()
  }

  method act() {
    snake.eat(self)
  }
}

object util {
  method randomX() = 1.randomUpTo(TAMANIO_X-1).floor()
  method randomY() = 1.randomUpTo(TAMANIO_Y-1).floor()
  method randomPosition() = game.at(self.randomX(), self.randomY())
}

object gameOver {
  method position() = game.at(9, 5)
  method image() = "GameOver.png"
}