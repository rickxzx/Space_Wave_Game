extends Control
var clique = 1
var tran :bool = false
var clicou : bool = false
@onready var config = preload("res://cenas/configurações.tscn")
var saiu : bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clicou = true
	tran = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	clique = 1
	$"Control/1".visible = true
	$"Control/>".visible = true
	$"Control/<".visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if !Global.sound:
		var bus_index = AudioServer.get_bus_index("Master")
		AudioServer.set_bus_mute(bus_index, true)
	if Global.sound:
		var bus_index = AudioServer.get_bus_index("Master")
		AudioServer.set_bus_mute(bus_index, false)
	if Input.is_action_just_pressed("ui_accept") and !saiu:
		if clique == 1 and tran == false:
			saiu = true
			$Entrou.play(0)
			$Control/Control/selection.play("play")
			await get_tree().create_timer(1).timeout
			$Control/AnimationPlayer.play("saida")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_file("res://cenas/map.tscn") 
		if clique == 3 and tran == false:
			saiu = true
			$Saiu.play(0)
			$Control/Control/selection.play("exit")
			await get_tree().create_timer(1).timeout
			$Control/AnimationPlayer.play("saida")
			await get_tree().create_timer(0.5).timeout
			get_tree().quit()
		if clique == 4 and tran == false:
			if !Global.saiu:
				Global.saiu = true
				var config1 = config.instantiate() 
				add_child(config1)
	if !saiu:
		if clicou == false and !Global.saiu:
			if Input.is_action_just_pressed("ui_right") and clique == 1:
				$Control/Control/selection.play("2")
				tran = true
				clicou = true
				$"Control/>".visible = true
				$"Control/<".visible = true
				$"Control/1".visible = false
				$"Control/2".visible = true
				$"Control/3".visible = false
				$Selection.play(0)
				await get_tree().create_timer(0.3).timeout
				clique = 2
				clicou = false
				tran = false
			if Input.is_action_just_pressed("ui_right") and clique == 2:
				$Control/Control/selection.play("3")
				tran = true
				clicou = true
				$Selection.play(0)
				$"Control/>".visible = false
				$"Control/<".visible = true
				$"Control/1".visible = false
				$"Control/2".visible = false
				$"Control/3".visible = true
				await get_tree().create_timer(0.3).timeout
				clique = 3
				tran = false
				clicou = false
			if Input.is_action_just_pressed("ui_left") and clique == 2:
				$Control/Control/selection.play("2-1")
				tran = true
				clicou = true
				$Selection.play(0)
				$"Control/>".visible = true
				$"Control/<".visible = true
				$"Control/1".visible = true
				$"Control/2".visible = false
				await get_tree().create_timer(0.3).timeout
				clique = 1
				tran = false
				clicou = false
			if Input.is_action_just_pressed("ui_left") and clique == 3:
				$Control/Control/selection.play("3-2")
				tran = true
				clicou = true
				$Selection.play(0)
				$"Control/>".visible = true
				$"Control/<".visible = true
				$"Control/3".visible = false
				$"Control/2".visible = true
				await get_tree().create_timer(0.3).timeout
				clique = 2
				tran = false
				clicou = false
			if Input.is_action_just_pressed("ui_left") and clique == 1:
				$Control/Control/selection.play("4")
				tran = true
				clicou = true
				$Selection.play(0)
				$"Control/>".visible = true
				$"Control/<".visible = false
				$"Control/1".visible = false
				$"Control/4".visible = true
				await get_tree().create_timer(0.3).timeout
				clique = 4
				tran = false
				clicou = false
			if Input.is_action_just_pressed("ui_right") and clique == 4:
				$Control/Control/selection.play("4-1")
				tran = true
				clicou = true
				$Selection.play(0)
				$"Control/>".visible = true
				$"Control/<".visible = true
				$"Control/1".visible = true
				$"Control/4".visible = false
				await get_tree().create_timer(0.3).timeout
				clique = 1
				tran = false
				clicou = false

func _on_menusound_finished() -> void:
	$"Menu-sound".play(0)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "entrada":
		clicou = false
		tran = false
