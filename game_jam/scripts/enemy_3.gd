extends Sprite2D
var speed = randi_range(100, 130)
var chance = randi_range(1,5)
var velocity = Vector2()
var stun : bool = false
@export var life = 5
@onready var particulas = preload("res://cenas/particula.tscn")
@onready var curaa = preload("res://cenas/cura_max.tscn")


func _ready() -> void:
	Global.inimigos_gerados += 1

func _process(delta: float) -> void:
	if Global.player != null:
		velocity = global_position.direction_to(Global.player.global_position)
	if Global.time_z == false and stun == false:
		global_position += velocity * speed * delta
	if Global.time_z == true and stun == false:
		global_position += velocity * Global.velocity_enemy * delta
	if Global.time_z == false and stun == true:
		global_position -= velocity * 220 * delta
	if Global.time_z == true and stun == true:
		global_position -= velocity * 50 * delta
	if life <= 0 and Global.criação != null:
		Global.explosão_do_cometa.play(0)
		var particula = Global.instance_node(particulas, global_position, Global.criação)
		if chance == 3:
			var _cura = Global.instance_node(curaa, global_position, Global.criação)
		particula.rotation_degrees = Global.bullet_rotation 
		particula.modulate = "ff0000cc"
		Global.inimigos_gerados -= 1
		Global.score += 300
		queue_free()
	look_at(Global.player_position * -1)

func cor_white() -> void:
	$".".modulate = "ff0000e8"


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("uti"):
		life -= 10
		$".".modulate = "ff00ffe8"
		$Timer.start(0.1)
	if area.is_in_group("bullets"):
		life -= 1
		$".".modulate = "ff00ffe8"
		$Timer.start(0.1)
		stun = true
		await get_tree().create_timer(0.1).timeout
		stun = false
