extends Node2D
var n = randi_range(1, 6)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if n == 1:
		$Gato1.visible = true
	elif n == 2:
		$Gato2.visible = true
	elif n == 3:
		$Gato3.visible = true
	elif n == 4:
		$Gato4.visible = true
	elif n == 5:
		$Gato5.visible = true
	elif n == 6:
		$Gato6.visible = true


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
