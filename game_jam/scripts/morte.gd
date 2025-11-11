extends Control
var item = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false
	$ColorRect.visible = false
	$game_over.position.y = -400 
	await get_tree().create_timer(0.3).timeout

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_up") and item == 2:
		if Global.morto:
			item = 1
			$"Control/[".visible = true
			$"Control/]".visible = true
			$"Control/[2".visible = false
			$"Control/]2".visible = false
	if Input.is_action_just_pressed("ui_down") and item == 1:
		if Global.morto:
			item = 2
			$"Control/[".visible = false
			$"Control/]".visible = false
			$"Control/[2".visible = true
			$"Control/]2".visible = true
	if Input.is_action_just_pressed("ui_accept"):
		if item == 1 and Global.morto:
			get_tree().paused = false
			get_tree().change_scene_to_file("res://cenas/menu.tscn")
		if item == 2 and Global.morto:
			get_tree().reload_current_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
		$game_over/Label.text = "Your best wave: " + str(Global.wave_max) + "\n" + "Your death wave: " + str(Global.WAVE)

func _on_reset_pressed() -> void:
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://cenas/menu.tscn")
