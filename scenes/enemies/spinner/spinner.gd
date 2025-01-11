extends RigidBody2D

var progress_speed: float
var arc_starting_position: Vector2


func _start_arc() -> void:
    self.arc_starting_position = self.global_position
    $Path2D/PathFollow2D.progress_ratio = 0


func _move_along_the_arc(delta: float) -> void:
    $Path2D/PathFollow2D.progress_ratio += self.progress_speed * delta

    self.global_position = (
        self.arc_starting_position
        + $Path2D/PathFollow2D.position.rotated(self.global_rotation)
    )
    $AnimatedSprite2D.speed_scale = 1.1 - abs($Path2D/PathFollow2D.progress_ratio - 0.5)

    if $Path2D/PathFollow2D.progress_ratio == 1:
        self._start_arc()


func _ready() -> void:
    $AnimatedSprite2D.play("moving")
    self.progress_speed = randf_range(0.6, 1.2)
    self._start_arc()


func _process(delta: float) -> void:
    self._move_along_the_arc(delta)
