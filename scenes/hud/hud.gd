extends CanvasLayer

signal start_game


func _ready() -> void:
    $ScoreLabel.hide()
    $MenuGridContainer/GameOverLabel.hide()


func _on_start_button_pressed() -> void:
    $ScoreLabel.show()
    $MenuGridContainer/StartButton.hide()
    $MenuGridContainer/GameOverLabel.hide()
    start_game.emit()


func update_score(score: int) -> void:
    $ScoreLabel.text = str(score)


func end_game() -> void:
    $MenuGridContainer/StartButton.show()
    $MenuGridContainer/GameOverLabel.show()
