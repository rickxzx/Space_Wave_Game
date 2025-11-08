extends Node2D
@onready var power1 = preload("res://cenas/PowerUp1.tscn")
@onready var power2 = preload("res://cenas/PowerUp2.tscn")
var chance = randi_range(1,20)
var timen = randi_range(3,5)
var positionn = randi_range(49 ,1084)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Node2D.position.x = positionn


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_powerup_timeout() -> void:
	chance = randi_range(1,20)
	timen = randi_range(3,5)
	positionn = randi_range(49 ,1084)
	$Node2D.position.x = positionn
	$powerup.start(timen)
	if Global.WAVE >= 20:
		if chance >= 17:
			var po1 = power1.instantiate()
			add_child(po1)
			po1.global_position = $Node2D.global_position
			po1.global_position.x = $Node2D.global_position.x
		if chance <= 3:
			var po2 = power2.instantiate()
			add_child(po2)
			po2.global_position = $Node2D.global_position
			po2.global_position.x = $Node2D.global_position.x
