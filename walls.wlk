import snake.*

class Wall {
  const property position
  method image() = "wall.png"

  method act() {
    game.addVisual(gameOver)
    game.stop()
  }
}
