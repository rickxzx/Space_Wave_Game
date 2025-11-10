extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false
	$ColorRect.visible = false
	$game_over.position.y = -400 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		$game_over/Label.text = "Your best wave: " + str(Global.wave_max) + "\n" + "Your death wave: " + str(Global.WAVE)

func _on_reset_pressed() -> void:
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://cenas/menu.tscn")
