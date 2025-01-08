extends RigidBody2D


func _ready() -> void:
    $AnimatedSprite2D.play("moving")


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
    queue_free()
