extends Node2D
var n = randi_range(1, 3)
@onready var money = preload("res://cenas/notas_money.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start(0.1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	n = randi_range(1,3)
	$Timer.start(n)
	var money_instance = money.instantiate()
	$"../Node2D3".add_child(money_instance)
	money_instance.global_position = $money.global_position
