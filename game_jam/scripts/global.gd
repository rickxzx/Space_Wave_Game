extends Node
var player = null
var wave : bool = true
var wave2 : bool = true
var inimigos_quant = 4
var inimigos_gerados = 0
var score = 0
var WAVE = 0
var velocity_enemy = 30
var time_z1 : bool = false
var time_z : bool = false
var bullet_rotation = 0
var player_position = 0
var criação = null
var camera: Camera2D
var explosão_do_cometa: AudioStreamPlayer2D
var cam_effects : AnimationPlayer
var tiros_por_clique = 1
var life = 3
var uti_time = 15
var metranca : bool = false
var uti_charge : bool = false
var wave_max = 0
var paused : bool = false
var power_effect : AnimationPlayer
var local_anim : bool = false
var life_sound : AudioStreamPlayer2D
var power_up_sound : AudioStreamPlayer2D
var carregado : AudioStreamPlayer2D
var alert_fade_in : AnimationPlayer
var progress = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
	
