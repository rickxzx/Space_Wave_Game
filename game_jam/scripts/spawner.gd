extends Node2D
@onready var enemy = preload("res://cenas/enemy.tscn")
@onready var enemy2 = preload("res://cenas/enemy2.tscn")
@onready var enemy3 = preload("res://cenas/enemy3.tscn")
@onready var enemy4 = preload("res://cenas/enemy4.tscn")
var current_wave = 1
var clicou : bool = false
var primeiro : bool = false
var primeiro2 : bool = false
var primeiro3 : bool = false
var primeiro4 : bool = false
var primeiro5 : bool = false
var loja_button : bool = false
@onready var screen_size = get_viewport_rect().size
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.WAVE = 1
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$"../UI/loja2".visible = false
	Global.life = 3
	Global.camera = $"../Camera2D"
	Global.criação = self
	Global.inimigos_gerados = 0
	Global.inimigos_quant = 4
	Global.score = 0
	Global.player_life = 0
	Global.uti_charge = false
func _exit_tree():
	Global.criação = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.uti_charge == true:
		$"../UI/alert".visible = true
	if Global.uti_charge == false:
		$"../UI/alert".visible = false
	if Global.inimigos_gerados == 0 and clicou == false:
		Global.wave2 = false
		if primeiro == true:
			if loja_button == false:
				$"../UI/loja".visible = true
				$"../UI/Button".visible = true
	if clicou == true:
		$"../UI/loja".visible = false
		$"../UI/Button".visible = false
		$"../UI/loja2/return".visible = false
	$"../UI/inimigos".text = str(Global.inimigos_gerados)
	$"../UI/score".text = str(Global.score)
	$"../UI/loja2/Label".text = "Score: " + str(Global.score)
	if Global.player_life >= 0:
		$"../UI/life".text = str(Global.life)


func _on_spawn_timeout() -> void:
	Global.wave2 = true
	if primeiro3 == true:
		primeiro4 = true
	if primeiro == false:
		primeiro = true
	clicou = false
	loja_button = false
	for i in range(Global.inimigos_quant):
		var n = randi_range(1, 4)
		var diferente = randi_range(1,4)
		var o = enemy.instantiate()
		add_child(o)
		if n == 1:
			o.global_position = $spawner1.global_position
		if n == 2:
			o.global_position = $spawner2.global_position
		if n == 3:
			o.global_position = $spawner3.global_position
		if n == 4:
			o.global_position = $spawner4.global_position
		if diferente == 3 and primeiro2 == true:
			var o2 = enemy2.instantiate()
			add_child(o2)
			if n == 1:
				o2.global_position = $spawner1.global_position
			if n == 2:
				o2.global_position = $spawner2.global_position
			if n == 3:
				o2.global_position = $spawner3.global_position
			if n == 4:
				o2.global_position = $spawner4.global_position
		if diferente == 1 and primeiro5 == true:
			var o3 = enemy3.instantiate()
			add_child(o3)
			if n == 1:
				o3.global_position = $spawner1.global_position
			if n == 2:
				o3.global_position = $spawner2.global_position
			if n == 3:
				o3.global_position = $spawner3.global_position
			if n == 4:
				o3.global_position = $spawner4.global_position
		if diferente == 4 and current_wave >= 5:
			var o3 = enemy4.instantiate()
			add_child(o3)
			if n == 1:
				o3.global_position = $spawner1.global_position
			if n == 2:
				o3.global_position = $spawner2.global_position
			if n == 3:
				o3.global_position = $spawner3.global_position
			if n == 4:
				o3.global_position = $spawner4.global_position
		await get_tree().create_timer(0.3).timeout


func next_wave() -> void:
	current_wave += 1
	Global.WAVE += 1
	$"../UI/Label".text = "WAVE: " + str(current_wave)
	$"../UI/Label/AnimationPlayer".play("wave")
	$"../UI/Button/Impact".play(0)
	if primeiro2 == false:
		primeiro2 = true
	if primeiro2 == true:
		primeiro3 = true
	if primeiro4 == true:
		primeiro5 = true
	clicou = true
	Global.inimigos_quant += 1
	$Timer.start(3)


func _on_loja_pressed() -> void:
	loja_button = true
	Global.wave = false
	$"../UI/AnimationPlayer".play("loja1")
	$"../UI/score".visible = false
	$"../UI/Button".visible = false
	$"../UI/loja".visible = false
	$"../UI/loja2/return".visible = true
	$"../UI/loja2".visible = true

func _on_return_pressed() -> void:
	loja_button = false
	Global.wave = true
	$"../UI/AnimationPlayer".play("loja2")
	$"../UI/score".visible = true
	$"../UI/Button".visible = true
	$"../UI/loja".visible = true
	$"../UI/loja2/return".visible = false
