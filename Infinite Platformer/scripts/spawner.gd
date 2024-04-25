extends Node2D

@onready var obstacle_scene = preload("res://scenes/obstacle.tscn")
@onready var collectable_scene = preload("res://scenes/collectable.tscn")
@onready var timer = $Timer
@onready var spawner_container = get_tree().get_root().get_node("World/SpawnerContainer")
@export var timer_wait_time = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = timer_wait_time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	var spawn_num = randi() % 2
	if spawn_num:
		spawn_obstacle()
	else:
		spawn_collectable()

func spawn_obstacle():
	var obstacle = obstacle_scene.instantiate()
	obstacle.global_position = global_position
	spawner_container.add_child(obstacle)

func spawn_collectable():
	var collectable = collectable_scene.instantiate()
	collectable.global_position = global_position
	spawner_container.add_child(collectable)
