extends Control
var clique = 1
var tran :bool = false
var clicou : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	clique = 1
	$"Control/1".visible = true
	$"Control/>".visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if clique == 1 and tran == false:
			$Control/AnimationPlayer.play("saida")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_file("res://cenas/map.tscn") 
		if clique == 3 and tran == false:
			$Control/AnimationPlayer.play("saida")
			await get_tree().create_timer(0.5).timeout
			get_tree().quit()
	if clicou == false:
		if Input.is_action_just_pressed("ui_right") and clique == 1:
			tran = true
			clicou = true
			$"Control/>".visible = true
			$"Control/<".visible = true
			$"Control/1".visible = false
			$"Control/2".visible = true
			$"Control/3".visible = false
			await get_tree().create_timer(0.3).timeout
			clique = 2
			clicou = false
			tran = false
		if Input.is_action_just_pressed("ui_right") and clique == 2:
			tran = true
			clicou = true
			$"Control/>".visible = false
			$"Control/<".visible = true
			$"Control/1".visible = false
			$"Control/2".visible = false
			$"Control/3".visible = true
			await get_tree().create_timer(0.3).timeout
			clique = 3
			tran = false
			clicou = false
		if Input.is_action_just_pressed("ui_left") and clique == 2:
			tran = true
			clicou = true
			$"Control/>".visible = true
			$"Control/<".visible = false
			$"Control/1".visible = true
			$"Control/2".visible = false
			await get_tree().create_timer(0.3).timeout
			clique = 1
			tran = false
			clicou = false
		if Input.is_action_just_pressed("ui_left") and clique == 3:
			tran = true
			clicou = true
			$"Control/>".visible = true
			$"Control/<".visible = true
			$"Control/3".visible = false
			$"Control/2".visible = true
			await get_tree().create_timer(0.3).timeout
			clique = 2
			tran = false
			clicou = false
