extends Node2D
var explomb = preload("res://cenas/bullet_explomb.tscn")
@onready var circle: Sprite2D = $Circle


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Circle/AudioListener2D/Shoot.play(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Circle.position.x += 2000 * delta


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()


func deu_dano(area: Area2D) -> void:
	if area.is_in_group("enemy_1"):
		var particula = Global.instance_node(explomb, global_position, Global.criação)
		particula.global_position = circle.global_position
		particula.rotation = Global.bullet_rotation
		queue_free()
	if area.is_in_group("enemy_2"):
		var particula = Global.instance_node(explomb, global_position, Global.criação)
		particula.global_position = circle.global_position
		particula.rotation = Global.bullet_rotation
		queue_free()
	if area.is_in_group("enemy_3"):
		var particula = Global.instance_node(explomb, global_position, Global.criação)
		particula.global_position = circle.global_position
		particula.rotation = Global.bullet_rotation
		queue_free()
	if area.is_in_group("enemy4"):
		var particula = Global.instance_node(explomb, global_position, Global.criação)
		particula.global_position = circle.global_position
		particula.rotation = Global.bullet_rotation
		queue_free()


func _on_timer_timeout() -> void:
	queue_free()
