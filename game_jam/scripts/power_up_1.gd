extends Node2D
var velocity = 120


func _process(delta: float) -> void:
	global_position.y += velocity * delta

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("nave"):
		Global.time_z1 = true
		$Circle/Area2D.queue_free()
		$Circle.visible = false

func _on_timer_timeout() -> void:
	queue_free()
