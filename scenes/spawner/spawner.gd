extends Node

@export var spawnable_enemies: Array[PackedScene]
var enemy_count_limits: Array[int] = [3, 3, 3]
var enemy_counts: Array[int] = []


func _ready() -> void:
    for spawnable_eneny in self.spawnable_enemies:
        self.enemy_counts.append(0)


func _on_enemy_entered_tree(enemy_type_index: int) -> void:
    self.enemy_counts[enemy_type_index] += 1


func _on_enemy_exiting_tree(enemy_type_index: int) -> void:
    self.enemy_counts[enemy_type_index] -= 1


func _on_spawn_timer_timeout() -> void:
    var awailable_enemy_types: Array[int] = []
    for enemy_type_index in range(self.spawnable_enemies.size()):
        if self.enemy_counts[enemy_type_index] < self.enemy_count_limits[enemy_type_index]:
            awailable_enemy_types.append(enemy_type_index)
    if awailable_enemy_types.is_empty():
        return

    var enemy_type_index: int = awailable_enemy_types.pick_random()
    var enemy: RigidBody2D = self.spawnable_enemies[enemy_type_index].instantiate()

    var spawn_location: PathFollow2D = $SpawnerPath/SpawnerLocation
    spawn_location.progress_ratio = randf()

    enemy.position = spawn_location.position
    enemy.rotation = spawn_location.rotation + PI + randf_range(-PI / 4, PI / 4)
    enemy.linear_velocity = Vector2(randf_range(150.0, 250.0), 0.0).rotated(enemy.rotation - PI / 2)

    enemy.add_to_group("enemies")
    enemy.tree_entered.connect(self._on_enemy_entered_tree.bind(enemy_type_index))
    enemy.tree_exiting.connect(self._on_enemy_exiting_tree.bind(enemy_type_index))

    self.add_child(enemy)


func start_spawning() -> void:
    $SpawnTimer.start()


func stop_spawning() -> void:
    $SpawnTimer.stop()

func clear_spawned() -> void:
    self.get_tree().call_group("enemies", "queue_free")
