extends Node2D
var velocity = 120
var area_sumiu : bool = false

func _process(delta: float) -> void:
	global_position.y += velocity * delta

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("nave"):
		Global.power_up_sound.play(0)
		$Circle/Area2D.queue_free()
		$Circle.visible = false
		if Global.metranca == false:
			if Global.local_anim == true:
				area_sumiu = true
				Global.power_effect.play("powerup1")
				await get_tree().create_timer(0.5).timeout
				Global.local_anim = false
			if Global.local_anim == false and area_sumiu == false: 
				Global.power_effect.play("powerup1_normal")
			Global.metranca = true

func _on_timer_timeout() -> void:
	queue_free()
