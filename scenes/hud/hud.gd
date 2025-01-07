extends CanvasLayer

signal start_game


func update_score(score: int) -> void:
    $ScoreLabel.text = str(score)


func _on_start_button_pressed() -> void:
    $StartButton.hide()
    start_game.emit()
