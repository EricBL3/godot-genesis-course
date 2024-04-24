extends Node2D

@onready var obstacle_scene = preload("res://scenes/obstacle.tscn")
@onready var timer = $Timer
@onready var obstacle_container = get_tree().get_root().get_node("World/ObstacleContainer")
@export var timer_wait_time = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = timer_wait_time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_obstacle():
	var obstacle = obstacle_scene.instantiate()
	obstacle.global_position = global_position
	obstacle_container.add_child(obstacle)


func _on_timer_timeout():
	spawn_obstacle()
