extends Node2D
var n = randi_range(1, 3)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if n == 1:
		$Node2D/Money1.visible = true
	if n == 2:
		$Node2D/Money2.visible = true
	if n == 3:
		$Node2D/Money3.visible = true
