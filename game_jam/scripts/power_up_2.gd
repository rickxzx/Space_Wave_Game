extends Node2D
var velocity = 120


func _process(delta: float) -> void:
	global_position.y += velocity * delta

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("nave"):
		Global.metranca = true
		$Circle.visible = false
		$Circle/Area2D.queue_free()

func _on_timer_timeout() -> void:
	queue_free()
