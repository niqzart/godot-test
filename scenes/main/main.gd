extends Node

var score: int


func new_game() -> void:
    $Spawner.clear_spawned()

    score = 0
    $HUD.update_score(score)
    $Player.start($StartPosition.position)
    $StartTimer.start()

    $DeathSoundPlayer.stop()
    $SoundtrackPlayer.play()


func _on_start_timer_timeout() -> void:
    $ScoreTimer.start()
    $Spawner.start_spawning()


func _on_score_timer_timeout() -> void:
    score += 1
    $HUD.update_score(score)


func end_game() -> void:
    $ScoreTimer.stop()
    $Spawner.stop_spawning()
    $HUD.end_game()

    $SoundtrackPlayer.stop()
    $DeathSoundPlayer.play()
