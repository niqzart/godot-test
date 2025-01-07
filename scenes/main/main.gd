extends Node

var score: int


func new_game():
    score = 0
    $Player.start($StartPosition.position)
    $StartTimer.start()


func _ready() -> void:
    new_game()


func _on_start_timer_timeout() -> void:
    $ScoreTimer.start()


func _on_score_timer_timeout() -> void:
    score += 1
    $ScoreLabel.text = str(score)
