extends Node2D
var som = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(10):
		$AnimationPlayer/Label.text = str(i + 1)
		await wait_timers(1)
	await wait_timers(3.3)
	await escrever($Label, "Alright, pilot. Time to learn the basics\n" + "so you don’t explode in the first wave.", 0.05)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(1)
	await escrever($Label, "“WASD” or Arrow Keys\n" + "move around. Push and go, no mystery.", 0.05)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(1)
	await escrever($Label, "“E” \n" + "activates the Energy Shield.\n Don’t waste it, it’s your lifesaver.", 0.05)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(1)
	await escrever($Label, "“Q” or Space\n" + "uses your power-up. Don’t hoard it \n forever; use it when things get ugly.", 0.05)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(1)
	await escrever($Label, "“LMB”\n" + "shoot. Hold it down if you \n wanna become a bullet hose.", 0.05)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(1)
	await escrever($Label, "“ESC” or “P”\n" + "pause. Breathe, scratch your \n eye, grab some water, whatever.", 0.05)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(1)
	await escrever($Label, "“CTRL” or “RMB”\n" + "calls the next wave. Only \n press that if you’re actually ready for chaos.", 0.05)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(1)
	await escrever($Label, "“Shift”\n" + "run. Use it when walking just isn’t \n fast enough to stay alive.", 0.05)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(1)
	await escrever($Label, "That’s it. Go on.\n" + " The battlefield won’t wait.", 0.05)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(1)
	await escrever($Label, " ", 0.05)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(1)
	Global.entrou = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func wait_timers(seconds: float) -> void:
	var t = Timer.new()
	t.wait_time = seconds
	t.one_shot = true
	t.process_mode = Node.PROCESS_MODE_PAUSABLE
	add_child(t)
	t.start()
	await t.timeout
	t.queue_free()

func escrever(label: Label, texto: String, velocidade: float = 0.05) -> void:
	$Control/Label.text = ""
	for c in texto:
		if som == 2:
			$Control/Control/Circle/AnimatedSprite2D.play("default")
			som = 3
			$Control/Selection.play(0)
		if som == 3:
			som = 2
		$Control/Label.text += c
		await wait_timers(velocidade)
