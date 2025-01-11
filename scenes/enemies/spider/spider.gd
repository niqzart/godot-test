extends RigidBody2D


func _start_crawling() -> void:
    self.linear_velocity = Vector2(randf_range(150.0, 250.0), 0.0).rotated(self.rotation - PI / 2)
    self.angular_velocity = 0
    $CrawlTimer.wait_time = randf_range(0.5, 1)
    $CrawlTimer.start()


func _start_spinning() -> void:
    self.linear_velocity = Vector2(0, 0)
    self.angular_velocity = PI if randi_range(0, 1) == 0 else -PI
    $SpinTimer.wait_time = randf_range(0.2, 0.8)
    $SpinTimer.start()


func _ready() -> void:
    $AnimatedSprite2D.play("moving")
    self._start_crawling()


func _on_crawl_timer_timeout() -> void:
    self._start_spinning()


func _on_spin_timer_timeout() -> void:
    self._start_crawling()
