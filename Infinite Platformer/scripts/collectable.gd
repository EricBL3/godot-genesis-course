extends Area2D
class_name Collectable
@export var speed = 80
@export var value = 5

@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	var anim_num = randi() % 8
	match anim_num:
		0:
			animated_sprite.play("apple")
		1: 
			animated_sprite.play("bananas")
		2:
			animated_sprite.play("cherries")
		3: 
			animated_sprite.play("kiwi")
		4:
			animated_sprite.play("melon")
		5:
			animated_sprite.play("orange")
		6: 
			animated_sprite.play("pineapple")
		7:
			animated_sprite.play("strawberry")	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta
	
	if global_position.x <= -100.0:
		queue_free()


func _on_body_entered(body):
	if body is Player:
		print("Earned " + str(value) + " coins")
		queue_free()
