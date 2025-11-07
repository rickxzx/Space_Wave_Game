extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.save()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Global.pause_menu = true
	get_tree().change_scene_to_file("res://cenas/menu.tscn")
