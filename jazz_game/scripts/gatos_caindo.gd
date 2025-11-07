extends Node2D
var n = randi_range(1, 3)
@onready var cat = preload("res://cenas/gatos.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$gatos_caindo.start(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gatos_caindo_timeout() -> void:
	n = randi_range(1,15)
	$gatos_caindo.start(n)
	var cat_instance = cat.instantiate()
	add_child(cat_instance)
	cat_instance.global_position = $Node2D.global_position
