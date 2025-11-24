extends Node2D
var speed = randi_range(150, 160)
var chance = randi_range(1,5)
var velocity = Vector2()
var stun : bool = false
@export var life = 100
@onready var particulas = preload("res://cenas/particula.tscn")
@onready var cura = preload("res://cenas/cura__simples.tscn")
@onready var minions = preload("res://cenas/enemy.tscn")
@onready var minions2 = preload("res://cenas/enemy2.tscn")
@onready var minions3 = preload("res://cenas/enemy3.tscn")
@onready var minions4 = preload("res://cenas/enemy4.tscn")
@onready var spawn_timer = Timer.new()


func _ready() -> void:
	Global.boos_life.play("new_animation")
	Global.life_boss.value = life
	Global.inimigos_gerados += 1
	for i in range(5):
		var posição = randf_range(-138, 138)
		var m = Global.instance_node(minions, position, Global.criação)
		add_child(m)
		m.global_position = $Node2D.global_position
		await wait_timers(0.5)
	spawn_timer.wait_time = 3
	spawn_timer.one_shot = false
	add_child(spawn_timer)
	spawn_timer.timeout.connect(_spawn_minions)
	spawn_timer.start()

func _spawn_minions():
	var chance = randi_range(1,4)
	if life <= 0:
		spawn_timer.stop()
		return
	if chance == 1:
		for i in range(2):
			var posição = randf_range(-138, 138)
			$Node2D.position.x = posição
			$Node2D.position.y = posição
			var m = Global.instance_node(minions, global_position, Global.criação)
			add_child(m)
			m.global_position = $Node2D.global_position
			await get_tree().create_timer(0.5, false).timeout
	if chance == 2:
		for i in range(5):
			var posição = randf_range(-138, 138)
			$Node2D.position.x = posição
			$Node2D.position.y = posição
			var m = Global.instance_node(minions2, global_position, Global.criação)
			add_child(m)
			m.global_position = $Node2D.global_position
			await get_tree().create_timer(0.5, false).timeout
	if chance == 3:
		for i in range(5):
			var posição = randf_range(-138, 138)
			$Node2D.position.x = posição
			$Node2D.position.y = posição
			var m = Global.instance_node(minions3, global_position, Global.criação)
			add_child(m)
			m.global_position = $Node2D.global_position
			await get_tree().create_timer(0.5, false).timeout
	if chance == 4:
		for i in range(5):
			var posição = randf_range(-138, 138)
			$Node2D.position.x = posição
			$Node2D.position.y = posição
			var m = Global.instance_node(minions4, global_position, Global.criação)
			add_child(m)
			m.global_position = $Node2D.global_position
			await get_tree().create_timer(0.5, false).timeout

func wait_timers(seconds: float) -> void:
	var t = Timer.new()
	t.wait_time = seconds
	t.one_shot = true
	t.process_mode = Node.PROCESS_MODE_PAUSABLE
	add_child(t)
	t.start()
	await t.timeout
	t.queue_free()

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
		if chance == 2:
			var _cura = Global.instance_node(cura, global_position, Global.criação)
		particula.rotation_degrees = Global.bullet_rotation 
		particula.modulate = "000000"
		Global.inimigos_gerados -= 1
		Global.score += 100
		Global.boos_life.play("bye")
		$".".queue_free()

func tomou_dano(area: Area2D) -> void:
	if area.is_in_group("uti"):
		Global.life_boss.value -= 10
		life -= 10
		$".".modulate = "ffffffcc"
		stun = true
		await get_tree().create_timer(0.1).timeout
		cor_white()
		stun = false
	if area.is_in_group("bullets"):
		Global.life_boss.value -= 1
		life -= 1
		$".".modulate = "ffffffcc"
		stun = true
		await get_tree().create_timer(0.1).timeout
		cor_white()
		stun = false


func cor_white():
	$".".modulate = "ffffff"
