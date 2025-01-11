extends RigidBody2D

var is_fast: bool


func _update_movement_speed() -> void:
    var speed_scale = randf_range(0, 0.2)
    if self.is_fast:
        speed_scale += 0.8

    self.linear_velocity = Vector2(150 + 150 * speed_scale, 0.0).rotated(self.rotation - PI / 2)
    $AnimatedSprite2D.speed_scale = 0.75 + 0.5 * speed_scale


func _switch_moving_mode() -> void:
    self.is_fast = !self.is_fast
    self._update_movement_speed()


func _start_moving() -> void:
    self.is_fast = randi_range(0, 1) == 1
    self._update_movement_speed()
    $SpeedTimer.start()


func _ready() -> void:
    $AnimatedSprite2D.play("moving")
    self._start_moving()


func _on_speed_timer_timeout() -> void:
    self._switch_moving_mode()
