extends Node2D
var speed = 500
var n = 0
var velocity = Vector2()
@onready var bullet = preload("res://cenas/bullet.tscn")
@onready var explosion = preload("res://cenas/nave_explosion.tscn")
var screen_size = Vector2()
var camera = Global.camera
var morto : bool = false
var metra : bool = false
var clicou : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.power_up1 = false
	Global.power_up2 = false
	Global.morto = false
	$nave/uti/CollisionShape2D.disabled = true
	Global.player = self
	if camera:
		screen_size = get_viewport_rect().size * camera.zoom
	else:
		screen_size = get_viewport_rect().size


func _exit_tree():
	Global.player = null

func _input(_event: InputEvent) -> void:
	if Global.wave2 :
		if !morto and !Global.paused:
			if Input.is_action_just_pressed("PowerUP") and Global.metranca == true:
				if !clicou and !metra:
					clicou = true
					await wait_timers(0.1)
					clicou = false
					Global.metranca = false
					if Global.time_z1 == true:
						Global.local_anim = true
						Global.power_effect.play("powerup1_volta")
					if Global.time_z1 == false:
						Global.power_effect.play("power1_volta")
					metra = true
					Global.power_up2 = true
					Global.cam_effects.play("metra")
					await get_tree().create_timer(5).timeout
					metra = false
					Global.power_up2 = false
			if Input.is_action_just_pressed("PowerUP") and Global.time_z1 == true:
				if !clicou and !Global.time_z:
					clicou = true
					await wait_timers(0.1)
					clicou = false
					Global.time_z1 = false
					if Global.local_anim == true:
						Global.local_anim = false
						Global.power_effect.play("power2_volta")
					if Global.metranca == false and Global.local_anim == false:
						Global.power_effect.play("power2_volta")
					Global.time_z = true
					Global.power_up1 = true
					Global.cam_effects.play("freeze")
					$nave/Frezzing.play(0)
					await get_tree().create_timer(3).timeout
					Global.power_up1 = false
					Global.time_z = false

func wait_timers(seconds: float) -> void:
	var t = Timer.new()
	t.wait_time = seconds
	t.one_shot = true
	t.process_mode = Node.PROCESS_MODE_PAUSABLE
	add_child(t)
	t.start()
	await t.timeout
	t.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	screen_wrap()
	Global.bullet_rotation = $".".rotation_degrees
	Global.player_position = $".".global_position
	if Input.is_action_just_pressed("UTI") and Global.uti_charge:
		if !Global.paused:
			if Global.wave2 == true and !morto:
				Global.progress = 0
				Global.uti_charge = false
				Global.alert_fade_in.play("progress")
				$nave/uti/Energy.play(15.7)
				$nave/uti/AnimationPlayer.play("uti")
				$nave/uti/CollisionShape2D.disabled = false
	if Global.life <= 0 and morto == false:
		morto = true
		Global.morto = true
		get_tree().paused = true
		$PointLight2D.queue_free()
		var explo = explosion.instantiate()
		$"..".add_child(explo)
		explo.global_position = $".".global_position
		Global.morte_anim.play("morte")
		await wait_timers(1)
	velocity.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	velocity.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	if morto == false and !Global.paused:
		global_position += speed * velocity * delta
	var mouse = get_global_mouse_position() 
	if !morto and !Global.paused:
		look_at(mouse)
	if Input.is_action_just_pressed("LMB") and Global.wave == true:
		if !Global.paused:
			if metra == false and !morto:
				for i in range(Global.tiros_por_clique):
					var _shoot = bullet.instantiate()
					$"..".add_child(_shoot)
					call_deferred("_setup_bullet", _shoot)
	if Input.is_action_pressed("LMB") and Global.wave == true:
		if !Global.paused:
			if metra == true and !morto:
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

func toma_dano():
	$"..".modulate = "ff503fc2"
	$nave/Hurt.play(0)
	await wait_timers(0.1)
	$"..".modulate = "8b8b8b"

func tomou_dano(area: Area2D) -> void:
	if area.is_in_group("inimigo"):
		toma_dano()
		if area.is_in_group("enemy_1"):
			Global.life -= 1
			if Global.life <= 0:
				$nave/Area2D.queue_free()
				$nave/MusicTheme.stream_paused = true
				$nave/NaveExplode.play(0)
				$nave/Scream.play(0)
		if area.is_in_group("enemy_2"):
			Global.life -= 2
			if Global.life <= 0:
				$nave/Area2D.queue_free()
				$nave/MusicTheme.stream_paused = true
				$nave/NaveExplode.play(0)
				$nave/Scream.play(0)
		if area.is_in_group("enemy_3"):
			Global.life -= 3
			if Global.life <= 0:
				$nave/Area2D.queue_free()
				$nave/MusicTheme.stream_paused = true
				$nave/NaveExplode.play(0)
				$nave/Scream.play(0)
		if area.is_in_group("enemy4"):
			Global.life -= 1
			if Global.life <= 0:
				$nave/Area2D.queue_free()
				$nave/MusicTheme.stream_paused = true
				$nave/NaveExplode.play(0)
				$nave/Scream.play(0)
	if area.is_in_group("cura1"):
		if Global.life <= 9:
			Global.life += 1
		Global.score += 50
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
		Global.score += 150

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("run"):
		run()
	if Input.is_action_just_released("run"):
		não_run()

func run():
	speed = 600

func não_run():
	speed = 500

func _on_music_theme_finished() -> void:
	$nave/MusicTheme.play(0)


func uti_acabou(_anim_name: StringName) -> void:
	$nave/uti/CollisionShape2D.disabled = true
	Global.uti_charge = false
