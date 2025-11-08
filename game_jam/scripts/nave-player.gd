extends Node2D
var speed = 500
var velocity = Vector2()
@onready var bullet = preload("res://cenas/bullet.tscn")
@onready var explosion = preload("res://cenas/nave_explosion.tscn")
var screen_size = Vector2()
var camera = Global.camera
var morto : bool = false
var metra : bool = false
var uti_charge : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$nave/uti/uti.start(Global.uti_time)
	$nave/uti/CollisionShape2D.disabled = true
	Global.player = self
	if camera:
		screen_size = get_viewport_rect().size * camera.zoom
	else:
		screen_size = get_viewport_rect().size


func _exit_tree():
	Global.player = null

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("PowerUP") and Global.metranca == true:
		metra = true
		await get_tree().create_timer(5).timeout
		Global.metranca = false
		metra = false
	if Input.is_action_just_pressed("PowerUP") and Global.time_z1 == true:
		Global.time_z1 = false
		Global.time_z = true
		await get_tree().create_timer(3).timeout
		Global.time_z = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	screen_wrap()
	Global.bullet_rotation = $".".rotation_degrees
	Global.player_position = $".".global_position
	if Input.is_action_just_pressed("UTI") and uti_charge:
		if Global.wave2 == true:
			uti_charge = false
			Global.uti_charge = false
			$nave/uti/Energy.play(15.7)
			$nave/uti/AnimationPlayer.play("uti")
			$nave/uti/CollisionShape2D.disabled = false
	if Global.life <= 0:
		morto = true
		var explo = explosion.instantiate()
		$"..".add_child(explo)
		explo.global_position = $".".global_position
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
	velocity.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	velocity.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	if morto == false:
		global_position += speed * velocity * delta
	var mouse = get_global_mouse_position() 
	look_at(mouse)
	if Input.is_action_just_pressed("LMB") and Global.wave == true:
		if metra == false:
			for i in range(Global.tiros_por_clique):
				var _shoot = bullet.instantiate()
				$"..".add_child(_shoot)
				call_deferred("_setup_bullet", _shoot)
	if Input.is_action_pressed("LMB") and Global.wave == true:
		if metra == true:
			for i in range(Global.tiros_por_clique):
				var _shoot = bullet.instantiate()
				$"..".add_child(_shoot)
				call_deferred("_setup_bullet", _shoot)

func _setup_bullet(bullet_instance):
	bullet_instance.global_position = $nave/Node2D.global_position
	bullet_instance.rotation = rotation

func screen_wrap():
	global_position.x = wrapf(global_position.x, 0, screen_size.x)
	global_position.y = wrapf(global_position.y, 0, screen_size.y)

func tomou_dano(area: Area2D) -> void:
	if area.is_in_group("enemy_1"):
		Global.life -= 1
	if area.is_in_group("enemy_2"):
		Global.life -= 2
	if area.is_in_group("enemy_3"):
		Global.life -= 3
	if area.is_in_group("enemy4"):
		Global.life -= 1
	if area.is_in_group("cura1"):
		if Global.life <= 9:
			Global.life += 1
	if area.is_in_group("cura2"):
		if Global.life <= 9:
			if Global.life == 7:
				Global.life += 3
			if Global.life == 8:
				Global.life += 2
			if Global.life == 9:
				Global.life += 1
			if Global.life <= 6:
				Global.life += 3


func _on_uti_timeout() -> void:
	uti_charge = true
	Global.uti_charge = true


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	if uti_charge == false:
		$nave/uti/CollisionShape2D.disabled = true
		$nave/uti/uti.start(Global.uti_time)


func _on_music_theme_finished() -> void:
	$nave/MusicTheme.play(0)
