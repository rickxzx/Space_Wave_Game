extends Control
var paused : bool = false
var timen := 0.2
var item_selected = 1

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("esc") and Global.morto == false:
		item_selected = 1
		$"[2".visible = false
		$"]2".visible = false
		$"[".visible = true
		$"]".visible = true
	if Input.is_action_just_pressed("esc") and paused == false:
		if paused == false and Global.morto == false:
			Global.paused = true
			get_tree().paused = true
			$".".visible = true
			await get_tree().create_timer(timen).timeout
			paused = true
	if Input.is_action_just_pressed("esc") and paused == true:
		if Global.morto == false:
			Global.paused = false
			item_selected = 1
			get_tree().paused = false
			$".".visible = false
			await get_tree().create_timer(timen).timeout
			paused = false
	if Input.is_action_just_pressed("ui_up") and paused == true:
		$Selection.play(0)
		if item_selected == 1:
			item_selected = 1
		if item_selected == 2:
			item_selected = 1
			$"[2".visible = false
			$"]2".visible = false
			$"[".visible = true
			$"]".visible = true
	if Input.is_action_just_pressed("ui_down") and paused == true:
		$Selection.play(0)
		if item_selected == 2:
			item_selected = 2
		if item_selected == 1:
			$"[2".visible = true
			$"]2".visible = true
			$"[".visible = false
			$"]".visible = false
			item_selected = 2
	if Input.is_action_just_pressed("ui_accept") and paused == true:
		if item_selected == 1:
			item_selected = 1
			get_tree().paused = false
			$".".visible = false
			await get_tree().create_timer(timen).timeout
			paused = false
			Global.paused = false
		if item_selected == 2:
			Global.paused = false
			get_tree().paused = false
			get_tree().change_scene_to_file("res://cenas/menu.tscn")


func _on_resume_pressed() -> void:
	item_selected = 1
	get_tree().paused = false
	$".".visible = false
	await get_tree().create_timer(timen).timeout
	paused = false
	Global.paused = false


func _on_exit_pressed() -> void:
	Global.paused = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://cenas/menu.tscn")
