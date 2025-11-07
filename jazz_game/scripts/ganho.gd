extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = "+" + str(Global.ns)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
