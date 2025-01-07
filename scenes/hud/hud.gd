extends CanvasLayer


func update_score(score: int) -> void:
    $ScoreLabel.text = str(score)
