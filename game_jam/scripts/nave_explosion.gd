extends Node2D

func _on_timer_timeout() -> void:
	set_process(false)
	set_physics_process(false)
	set_process_input(false)
	set_process_internal(false)
	set_process_unhandled_input(false)
	set_process_unhandled_key_input(false)

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	queue_free()

func _on_fade_out_timeout() -> void:
	$AnimationPlayer.play("fade_out")
