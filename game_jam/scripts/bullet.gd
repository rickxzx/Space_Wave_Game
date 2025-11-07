extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Circle/AudioListener2D/Shoot.play(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Circle.position.x += 3000 * delta


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()


func deu_dano(area: Area2D) -> void:
	if area.is_in_group("enemy_1"):
		queue_free()
	if area.is_in_group("enemy_2"):
		queue_free()
	if area.is_in_group("enemy_3"):
		queue_free()
	if area.is_in_group("enemy4"):
		queue_free()


func _on_timer_timeout() -> void:
	queue_free()
