// import wollok.game.*
import config.*
object snake {
  var property position = game.at((TAMANIO_X-1)/2, (TAMANIO_Y-1)/2)

  method image() = "head.png"
  method eat(apple) {
    apple.reposition()
  }

  method move() {
    position = position.right(1)
    
  }
}

object apple {
  var property position = util.randomPosition()
  
  method image() = "apple.png"
  method reposition() {
    position = util.randomPosition()
  }
}

object util {
  method randomX() = 0.randomUpTo(TAMANIO_X).floor()
  method randomY() = 0.randomUpTo(TAMANIO_Y).floor()
  method randomPosition() = game.at(self.randomX(), self.randomY())
}