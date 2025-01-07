extends Node

@export var enemy_scene: PackedScene


func start_spawning() -> void:
    $SpawnTimer.start()


func _on_spawn_timer_timeout() -> void:
    var enemy: RigidBody2D = enemy_scene.instantiate()

    var spawn_location: PathFollow2D = $SpawnerPath/SpawnerLocation
    spawn_location.progress_ratio = randf()

    enemy.position = spawn_location.position
    enemy.rotation = spawn_location.rotation + PI / 2 + randf_range(-PI / 4, PI / 4)
    enemy.linear_velocity = Vector2(randf_range(150.0, 250.0), 0.0).rotated(enemy.rotation)

    add_child(enemy)


func stop_spawning() -> void:
    $SpawnTimer.stop()
