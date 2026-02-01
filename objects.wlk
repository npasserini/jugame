import snake.*
import config.*

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
