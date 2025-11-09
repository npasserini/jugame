object pepita {
  var property position = game.at(3, 3)
  var energy = 100

  method image() = "head"
  method energy() = energy
  method fly(minutes) {
    energy = energy - minutes * 3
  }
}