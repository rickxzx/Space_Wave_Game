extends Node2D
var skiped : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.save()
	if Input.is_action_just_pressed("ui_accept") and skiped == true:
		Global.pause_menu = true
		get_tree().change_scene_to_file("res://cenas/menu.tscn")


func _on_timer_2_timeout() -> void:
	$Camera2D/VideoStreamPlayer.play()


func skip() -> void:
	$Camera2D/Label2.visible = true
	skiped = true
	
