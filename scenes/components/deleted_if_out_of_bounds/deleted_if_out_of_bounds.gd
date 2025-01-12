extends Area2D


func _on_area_exited(_area: Area2D) -> void:
    self.get_parent().queue_free()
