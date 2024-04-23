extends ParallaxBackground
@onready var texture_rect = $ParallaxLayer/TextureRect
@export var scroll_speed = 50
@export var bg_texture: CompressedTexture2D = preload("res://assets/textures/bg/Blue.png")

func _ready():
	texture_rect.texture = bg_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= scroll_speed * delta
