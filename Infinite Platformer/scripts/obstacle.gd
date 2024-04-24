extends Area2D

@export var speed = 80

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta
	
	if global_position.x <= -100.0:
		queue_free()


func _on_body_entered(body):
	if body is Player:
		body.die()
