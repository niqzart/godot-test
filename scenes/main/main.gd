extends Node


func _ready() -> void:
    $Player.start($StartPosition.position)
