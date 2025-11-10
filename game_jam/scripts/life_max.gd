extends Sprite2D
var speed = 300
var velocity = Vector2()
var seguindo : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"../PointLight2D".global_position = $".".global_position
	velocity = global_position.direction_to(Global.player.global_position)
	if seguindo:
		global_position += velocity * speed * delta

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("nave"):
		Global.life_sound.play(0)
		$"..".queue_free()


func _on_timer_timeout() -> void:
	$"..".queue_free()


func seguir(area: Area2D) -> void:
	if area.is_in_group("nave"):
		$AnimationPlayer.pause()
		seguindo = true
