extends Node2D
var pode : bool = false
@onready var tutorial = preload("res://cenas/história.tscn")

func _input(event: InputEvent) -> void:
	if !Global.paused:
		if Input.is_action_just_pressed("enter") and pode:
			$AnimationPlayer.play("fade-out")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.morto = false
	$ColorRect2.modulate = "ffffff00"
	var tuto = tutorial.instantiate()
	$Control2.add_child(tuto)
	Global.intro = $AnimationPlayer

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


func _on_animation_player_animation_finished2(anim_name: StringName) -> void:
	pode = true
