extends Node2D
var pode : bool = false
@onready var tutorial = preload("res://cenas/história.tscn")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and pode:
		$AnimationPlayer.play("fade-out")
		Global.entrou = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await wait_timers(1.2)
	pode = true
	if !Global.entrou:
		var tuto = tutorial.instantiate()
		add_child(tuto)
		await wait_timers(54)
		$AnimationPlayer.play("fade-out")

func wait_timers(seconds: float) -> void:
	var t = Timer.new()
	t.wait_time = seconds
	t.one_shot = true
	t.process_mode = Node.PROCESS_MODE_PAUSABLE
	add_child(t)
	t.start()
	await t.timeout
	t.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade-out":
		get_tree().change_scene_to_file("res://cenas/map.tscn")
