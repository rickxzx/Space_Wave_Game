extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_parent():
		if get_parent().rotation_degrees == 0:
			$".".position.x -= 1
		if get_parent().rotation_degrees >= -180:
			$".".position.x += 1
