import snake.*
import game.*
import config.*

class Wall {
  const property position
  method image() = "wall.png"

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
