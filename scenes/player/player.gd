extends Area2D

signal hit

@export var speed: int = 400
var screen_size: Vector2


func _ready() -> void:
    hide()
    screen_size = get_viewport_rect().size


func start(starting_position: Vector2) -> void:
    position = starting_position
    $CollisionShape2D.disabled = false
    show()


func _process(delta: float) -> void:
    var velocity: Vector2 = Vector2.ZERO
    if Input.is_action_pressed("move_right"):
        velocity.x += 1
    if Input.is_action_pressed("move_left"):
        velocity.x -= 1
    if Input.is_action_pressed("move_down"):
        velocity.y += 1
    if Input.is_action_pressed("move_up"):
        velocity.y -= 1

    if velocity.length() == 0:
        $AnimatedSprite2D.stop()
        return

    rotation = velocity.angle() + PI / 2
    position += velocity.normalized() * speed * delta
    position = position.clamp(Vector2.ZERO, screen_size)
    $AnimatedSprite2D.play()


func _on_body_entered(_body: Node2D) -> void:
    hide()
    hit.emit()
    $CollisionShape2D.set_deferred("disabled", true)
