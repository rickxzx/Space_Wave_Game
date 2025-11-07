extends Line2D
@export var frequencia = 200
@export var amplitude = 15
@export var periodo = 100
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var array := []

	for i in range(periodo):
		array.append(Vector2(
			200 + i * amplitude,
			200 + sin(i) * frequencia
		))

	points = array
