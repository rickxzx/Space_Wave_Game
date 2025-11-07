extends Control
var paused = false

func _on_pause_pressed() -> void:
	if paused == false:
		$AnimationPlayer.play("PAUSE")
		$".".visible = true
		$Button.visible = true
		$Panel.visible = true
		$"../pause".visible = false
		$pause2.visible = true
		paused = true

func _process(delta: float) -> void:
	pass


func _on_pause_2_pressed() -> void:
	if paused == true:
		$Branco2.visible = false
		$Button.visible = false
		$Button.visible = false
		$Panel.visible = false
		$pause2.visible = false
		$"../pause".visible = true
		get_tree().paused = false
		paused = false


func _on_button_pressed() -> void:
	if paused == true:
		Global.pause_menu = true
		get_tree().paused = false
		get_tree().change_scene_to_file("res://cenas/menu.tscn")
