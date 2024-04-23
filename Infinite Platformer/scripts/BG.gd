extends ParallaxBackground
@onready var sprite = $ParallaxLayer/Sprite2D
@export var scroll_speed = 15
@export var bg_texture: CompressedTexture2D = preload("res://assets/textures/bg/Blue.png")

func _ready():
	sprite.texture = bg_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite.region_rect.position += delta * Vector2(scroll_speed, scroll_speed)
	if sprite.region_rect.position >= Vector2(64, 64):
		sprite.region_rect.position = Vector2.ZERO
