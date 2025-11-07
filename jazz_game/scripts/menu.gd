extends Control
var jogar : bool = false
var jogo : bool = false
var exit : bool = false
var anim : bool = false
var config : bool = false

func _ready() -> void:
	Global.load_save()
	if Global.pause_menu == true:
		$AnimationPlayer.play("voltou")
		Global.pause_menu = false
	$Node2D2/Patinha6.visible = false
	$Node2D2/Patinha7.visible = false
	$Node2D2/Patinha9.visible = false
	$Node2D2/Patinha10.visible = false
	$Node2D2/Patinha11.visible = false
	$Node2D2/Patinha12.visible = false
	jogo = true

func _on_play_pressed() -> void:
	if anim == true:
		$AnimationPlayer.play("jogar")
		jogar = true

func _on_creditos_pressed() -> void:
	if anim == true:
		$finais.visible = true
		if Global.final1 == true:
			$finais/final_ruim.visible = true
		if Global.final2 == true:
			$finais/final_bom.visible = true
		if Global.final3 == true:
			$finais/final_neutro.visible = true
		if Global.final_secret == true:
			$finais/secret.visible = true
		$Node2D.visible = false
		$Button.visible = true
		$Button.disabled = false

func _on_exit_pressed() -> void:
	if anim == true:
		Global.voltou_denovo = true
		$AnimationPlayer.play("jogar")
		exit = true

func esc_pressed() -> void:
	$finais.visible = false
	$Node2D.visible = true
	$Button.visible = false
	$Button.disabled = true


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if jogar == true:
		get_tree().change_scene_to_file("res://cenas/história.tscn")
	if exit == true:
		get_tree().quit()
	if jogo == true:
		jogo = false
		$"Loop-menu-preview-109594".play(0)
	anim = true


func _on_loopmenupreview_109594_finished() -> void:
	$"Loop-menu-preview-109594".play(0)

func _physics_process(delta: float) -> void:
	Global.save()
