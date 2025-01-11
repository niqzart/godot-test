extends VisibleOnScreenNotifier2D


func _on_screen_exited() -> void:
    self.get_parent().queue_free()
