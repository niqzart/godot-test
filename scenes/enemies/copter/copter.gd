extends RigidBody2D


func _ready() -> void:
    $AnimatedSprite2D.play("moving")
    self.linear_velocity = Vector2(randf_range(150.0, 250.0), 0.0).rotated(self.rotation - PI / 2)
