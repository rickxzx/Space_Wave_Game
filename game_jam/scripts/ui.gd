extends Node2D
var uti_time_falta = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.progress = 0
	Global.morte_anim = $"../morte/AnimationPlayer"

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("UTI") and Global.uti_charge == true:
		uti_time_falta = 0.0
		$ProgressBar.value = 0

func uti_timer():
	if $ProgressBar.value == 100 and !Global.uti_charge:
		Global.uti_charge = true
		Global.alert_fade_in.play("alert")
		Global.carregado.play(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	uti_timer()
	if Global.uti_charge == false and Global.wave2:
		uti_time_falta += delta
		$ProgressBar.value = (uti_time_falta/Global.uti_time) * 100
	if Global.power_up1 == true:
		$powerup_uso/power_up1.visible = true
		$powerup_uso/power_up1.value -= (delta/3) * 100
	if Global.power_up1 == false:
		$powerup_uso/power_up1.visible = false
		$powerup_uso/power_up1.value = 100
	if Global.power_up2 == true:
		$powerup_uso/power_up2.visible = true
		$powerup_uso/power_up2.value -= (delta/5) * 100
	if Global.power_up2 == false:
		$powerup_uso/power_up2.visible = false
		$powerup_uso/power_up2.value = 100
