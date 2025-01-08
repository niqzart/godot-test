extends Node

@export var spawable_enemies: Array[PackedScene]


func start_spawning() -> void:
    $SpawnTimer.start()


func _on_spawn_timer_timeout() -> void:
    var enemy_type: PackedScene = spawable_enemies[randi_range(0, spawable_enemies.size() - 1)]
    var enemy: RigidBody2D = enemy_type.instantiate()

    var spawn_location: PathFollow2D = $SpawnerPath/SpawnerLocation
    spawn_location.progress_ratio = randf()

    enemy.position = spawn_location.position
    enemy.rotation = spawn_location.rotation + PI + randf_range(-PI / 4, PI / 4)
    enemy.linear_velocity = Vector2(randf_range(150.0, 250.0), 0.0).rotated(enemy.rotation - PI / 2)

    enemy.add_to_group("enemies")

    add_child(enemy)


func stop_spawning() -> void:
    $SpawnTimer.stop()

func clear_spawned() -> void:
    get_tree().call_group("enemies", "queue_free")
