import godot
import godotapi / [engine,input,kinematic_body_2d,animated_sprite,collision_shape_2d]

gdobj Player of KinematicBody2D:
  var sprite: AnimatedSprite
  var collision : CollisionShape2D
  var screenSize: Vector2
  var speed* {.gdExport.} = 200

  method ready*()=
    self.sprite = self.getNode("PlayerSprite").as(AnimatedSprite)
    self.collision = self.getNode("PlayerCollision").as(CollisionShape2D)

  method input*(event: InputEvent) =
    self.screenSize = self.getViewPortRect().size

  method process*(delta: float64)=
    if (self.sprite == nil) or (self.collision == nil):
      echo "sprite or collision not initiated"

    var movement : Vector2 = vec2()

    # to assert keyboard input with sprite movement
    if isActionPressed("ui_right"): 
      movement.x += 1.0 
    if isActionPressed("ui_left"): 
      movement.x -= 1.0
     
    # checking is the sprite moving or not
    # by checking length
    if (movement.length() > 0):
      movement = movement.normalized() * self.speed.float64
      discard self.moveAndSlide(movement)
      self.sprite.play()
    else:
      self.sprite.frame = 0 # to set default frame when stop
      self.sprite.stop()

    # checking screen limit
    self.position = vec2(
        clamp(self.position.x,0,self.screenSize.x),
        clamp(self.position.y,0,self.screenSize.y)
      )

    # to hold sprite to not 
    # get outside camera
        # check animation 
    if movement.x != 0:
      self.sprite.animation = "left"
      self.sprite.flipH = movement.x > 0 # if not move to right, flip
      self.sprite.flipV = false # prevent flip up-side downv

