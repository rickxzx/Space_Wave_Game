extends ParallaxBackground

@export var speed: Vector2 = Vector2(100, 0)

func _process(delta):
	scroll_base_offset += speed * delta
