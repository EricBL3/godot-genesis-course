extends CharacterBody2D
class_name Player

@export var jump_velocity = 400.0
@onready var animated_sprite = $AnimatedSprite2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if is_on_floor():
		if animated_sprite.animation != "run":
			animated_sprite.play("run")
	else:
		if animated_sprite.animation != "jump":
			animated_sprite.play("jump")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y -= jump_velocity

	move_and_slide()

func die():
	queue_free()
