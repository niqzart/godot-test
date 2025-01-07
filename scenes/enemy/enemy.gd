extends RigidBody2D


func _ready() -> void:
    var mob_types: PackedStringArray = $AnimatedSprite2D.sprite_frames.get_animation_names()
    $AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])
