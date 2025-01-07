extends Node

var score: int


func new_game():
    score = 0
    $Player.start($StartPosition.position)
    $StartTimer.start()


func _on_start_timer_timeout() -> void:
    $ScoreTimer.start()
    $Spawner.start_spawning()


func _on_score_timer_timeout() -> void:
    score += 1
    $HUD.update_score(score)
