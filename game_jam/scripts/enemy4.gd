extends Sprite2D
var speed = randi_range(130, 190)
var filhos = 1
var velocity = Vector2()
var life = 1
var explodiu : bool = false
@onready var particulas = preload("res://cenas/particula_2.tscn")
@onready var filhote = preload("res://cenas/enemy2.tscn")

func _ready() -> void:
	if Global.WAVE <= 10:
		filhos = randi_range(1,3)
	if Global.WAVE >= 10 and Global.WAVE <= 20:
		filhos = randi_range(1,6)
	if Global.WAVE >= 21:
		filhos = 5
	Global.inimigos_gerados += 1

func _process(delta: float) -> void:
	if Global.player != null:
		velocity = global_position.direction_to(Global.player.global_position)
	if !explodiu:
		if Global.time_z == false:
			global_position += velocity * speed * delta
		if Global.time_z == true:
			global_position += velocity * Global.velocity_enemy * delta
	if explodiu == true and Global.criação != null:
		if filhos == 0:
			Global.explosão_do_cometa.play(0)
			var particula = Global.instance_node(particulas, global_position, Global.criação)
			particula.rotation_degrees = Global.bullet_rotation 
			particula.modulate = "f8c95cb6"
			Global.inimigos_gerados -= 1
			Global.score += 300
			queue_free()
	look_at(Global.player_position * -1)

func return_dano() -> void:
	$".".modulate = "f8c95cb6"


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullets"):
		explodiu = true
		life -= 1
		if life <= 1:
			$Area2D.queue_free()
			$AnimationPlayer.play("explodir")
		$".".modulate = "f8c9aab6"
		$Timer.start(0.1)
	if area.is_in_group("uti"):
		$Area2D.queue_free()
		$AnimationPlayer.play("explodir")
		explodiu = true
		life -= 10
		$".".modulate = "f8c9aab6"
		$Timer.start(0.1)


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	for i in range(filhos):
		var _filhotinho = Global.instance_node(filhote, global_position, Global.criação)
		filhos -= 1
		await get_tree().create_timer(0.6).timeout
