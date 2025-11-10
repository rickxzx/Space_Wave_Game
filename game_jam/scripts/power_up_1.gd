extends Node2D
var velocity = 120


func _process(delta: float) -> void:
	global_position.y += velocity * delta

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("nave"):
		Global.power_up_sound.play(0)
		if Global.time_z1 == false:
			if Global.metranca == true:
				Global.power_effect.play("powerup2")
			if Global.metranca == false:
				Global.local_anim = true
				Global.power_effect.play("power2")
			Global.time_z1 = true
		$Circle/Area2D.queue_free()
		$Circle.visible = false

func _on_timer_timeout() -> void:
	queue_free()
