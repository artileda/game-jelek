import godot 
import godotapi / [engine, node_2d]

gdobj Main of Node2D:

  method ready*() =
    self.setProcess(true)
    echo("main scene")
