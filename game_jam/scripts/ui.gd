extends Node2D
var uti_time_falta = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.progress = 0
	Global.morte_anim = $"../morte/AnimationPlayer"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.uti_charge == false:
		uti_time_falta += delta
		$ProgressBar.value = (uti_time_falta/Global.uti_time) * 100
	if Global.uti_charge == true:
		uti_time_falta = 0.0
		$ProgressBar.value = 100
