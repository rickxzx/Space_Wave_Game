extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.cookie = 0
	Global.arranhador = 0
	Global.novelo = 0
	Global.caixa = 0
	Global.peixinho = 0
	Global.point_multi = 1
	Global.pontos_acum = 0
	Global.pause_menu = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
