extends Area2D
@onready var cliques_ = preload("res://cenas/cliques.tscn")
var ns : bool = false
var pon : bool = false
var J : bool = false
var A : bool = false
var Z : bool = false
var z : bool = false
var final2 : bool = false
var neutro : bool = false
var loja : bool = false
var jazz : bool = false
var fim1 : bool = false
var fim2 : bool = false
var fim3 : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.load_save()
	print(Global.final_secret)
	$Label.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.pontos_acum >= 1:
		get_tree().queue_delete($"../final2/bom")
	Global.save()
	if Input.is_action_just_pressed("LMB") and ns == true:
		if loja == false:
			if neutro == true:
				get_tree().queue_delete($"../final3")
			var money_instance = cliques_.instantiate()
			$"..".add_child(money_instance)
			money_instance.global_position = get_global_mouse_position() * 0.97
			if Global.pontos_acum <= 500000 and Global.pontos_acum <= 600000:
				$"../final_neutro".start(10)
			if Global.pontos_acum >= 600001:
				neutro = true
			if final2 == false:
				final2 = true
			if Global.pontos_acum == 9 and pon == false:
				$"../Node2D2/AudioStreamPlayer2D".play(0)
				pon = true
				$"../Node2D2/Node2D/Label".visible = true
			if Global.pontos_acum == 1000000 and pon == true:
				$"../Node2D2/Node2D/Label2".visible = true
				$"../Node2D2/AudioStreamPlayer2D".play(0)
			$"../Node2D/meow".play(0)
			$"../AnimationPlayer".pause()
			Global.pontos_acum += Global.point_multi
	$"../Camera2D/PONTOS".text = str(Global.pontos_acum)
	if Input.is_action_just_pressed("J") and J == false:
		J = true
	if Input.is_action_just_pressed("A") and J == true:
		if A == false:
			A = true
	if Input.is_action_just_pressed("Z") and A == true:
		if Z == false:
			Global.final_secret = true
			jazz = true
			$"../finalização".play("final")
	if Global.pontos_acum >= 1000000:
		$"../final1".visible = true
	if Global.pontos_acum <= 1000000:
		$"../final1".visible = false

func _on_mouse_entered() -> void:
	$Cat1.scale.x = 1.005
	$Cat1.scale.y = 1.005
	ns = true


func _on_mouse_exited() -> void:
	$Cat1.scale.x = 1
	$Cat1.scale.y = 1
	ns = false


func _on_loja_pressed() -> void:
	loja = true
	$"../Node2D/loja".play(0.3)
	$"../loja".disabled = true
	$"../LOJA/sair".disabled = false
	$"../loja".visible = false
	$"../LOJA/sair".visible = true
	$"../AnimationPlayer".play("LOJA")


func _on_sair_pressed() -> void:
	loja = false
	$"../Node2D/loja".play(0.3)
	$"../loja".disabled = false
	$"../LOJA/sair".disabled = true
	$"../loja".visible = true
	$"../LOJA/sair".visible = false
	$"../AnimationPlayer".play("LOJA_REVERSE")


func _on_musica_finished() -> void:
	$"../Node2D/musica".play(0)


func _on_pause_pressed() -> void:
	get_tree().paused = true


func _on_final_timeout() -> void:
	if final2 == false:
		$"../final2".visible = true


func _on_final_neutro_timeout() -> void:
	if Global.pontos_acum >= 500001 and neutro == false:
		if Global.pontos_acum <= 600001:
			$"../final3".visible = true


func _on_ruim_pressed() -> void:
	Global.final1 = true
	$"../finalização".play("final")
	fim1 = true


func _on_bom_pressed() -> void:
	Global.final2 = true
	$"../finalização".play("final")
	fim2 = true


func _on_neutro_pressed() -> void:
	Global.final3 = true
	$"../finalização".play("final")
	fim3 = true


func _on_finalização_animation_finished(anim_name: StringName) -> void:
	if jazz == true:
		get_tree().change_scene_to_file("res://cenas/final3.tscn")
	if fim1 == true:
		get_tree().change_scene_to_file("res://cenas/final1.tscn")
	if fim2 == true:
		get_tree().change_scene_to_file("res://cenas/final2.tscn")
	if fim3 == true:
		get_tree().change_scene_to_file("res://cenas/final4.tscn")
