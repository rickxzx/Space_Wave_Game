extends Control
var entrou : bool = false
var clicou : bool = false
var sound : bool = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel") and entrou:
		sair()
	if !sound:
		if Input.is_action_just_pressed("ui_accept") and entrou:
			if Global.sound == true and !clicou:
				sound = true
				clicou = true
				$ColorRect/sound/sound.button_pressed = true
				await get_tree().create_timer(0.3).timeout
				Global.sound = false
				clicou = !true
				sound1()

		if Input.is_action_just_pressed("ui_accept") and entrou:
			if Global.sound == false and !clicou:
				sound = true
				clicou = true
				$ColorRect/sound/sound.button_pressed = false
				await get_tree().create_timer(0.3).timeout
				Global.sound = true
				clicou = !true
				sound1()

func sound1():
	await get_tree().create_timer(0.3).timeout
	sound = false

func sair():
	$AnimationPlayer.play("exit")
	entrou = !true
	await get_tree().create_timer(0.3).timeout
	Global.saiu = false
	$".".queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	entrou = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !Global.sound:
		$ColorRect/sound/sound.button_pressed = true
	if Global.sound:
		$ColorRect/sound/sound.button_pressed = false

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "intro":
		entrou = true
 

func _on_exit_pressed() -> void:
	if entrou:
		entrou = !true
		sair()

func _on_sound_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		Global.sound = false
		print(Global.sound)
	if toggled_on == false:
		Global.sound = true
		print(Global.sound)
