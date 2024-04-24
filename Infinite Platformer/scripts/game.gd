extends Node

var game_started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		if !game_started:
			game_started = true
			get_tree().paused = false
	
	if Input.is_action_just_pressed("pause"):
		if game_started:
			if get_tree().paused:
				get_tree().paused = false
			else: 
				get_tree().paused = true
