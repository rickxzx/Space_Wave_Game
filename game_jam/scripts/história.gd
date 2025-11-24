extends Node2D
var som = 2
var n = 10
var time = 0.06

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"power-explan/Circle".visible = false
	$"power-explan/Circle2".visible = false
	for i in range(n):
		$AnimationPlayer/Label.text = str(n - i)
		await wait_timers(1)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(1)
	$"power-explan/Eco-bass-effect".play(0)
	await escrever($Label, "Alright, pilot. Time to learn the basics\n" + "so you don’t explode in the first wave.", time)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(2)
	await escrever($Label, "“WASD” or Arrow Keys\n" + "Move around. Push and go, no mystery.", time)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(2)
	await escrever($Label, "“E” \n" + "Activates the Energy Shield.\n Don’t waste it, it’s your lifesaver.", time)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(2)
	await escrever($Label, "“Q” or Space\n" + "Uses your power-up. Don’t hoard it \n forever; use it when things get ugly.", time)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(2)
	await escrever($Label, "“LMB”\n" + "Shoot. Hold it down if you \n wanna become a bullet hose.", time)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(2)
	await escrever($Label, "“ESC” or “P”\n" + "Pause. Breathe, scratch your \n eye, grab some water, whatever.", time)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(2)
	await escrever($Label, "“CTRL” or “RMB”\n" + "Calls the next wave. Only \n press that if you’re actually ready for chaos.", time)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(2)
	await escrever($Label, "“Shift”\n" + "Run. Use it when walking just isn’t \n fast enough to stay alive.", time)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(2)
	$"power-explan".play("verde")
	await escrever($Label,"Alright, listen up. I'm only saying this once. See that green power up? Time-Z Cold. That's your little cheat against the universe. Hit it and everything just freezes for three seconds. Comets, enemies, bullets, the whole mess stops in place. Only you keep moving. It's short, but it's enough to save your ship if you don't blow it by panicking." , time)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(10)
	$"power-explan".play("vermelho")
	await escrever($Label, "Now the red one... that's for when you want pure destruction. Hunter Mode. Five seconds of turning your ship into a flying meat grinder. Hold the fire button and you basically become a machine gun with wings. Perfect for clearing waves, smashing through a tight spot, or tearing a boss apart when they show up every ten waves. So yeah. Green stops the world. Red destroys the world. Use them right, or get turned into space dust." , time)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(10)
	$"power-explan".play("mel")
	await escrever($Label, "Alright, listen up. You’re not out here breaking comets just to kill time. The whole game runs in waves, and every wave pushes harder than the last: faster enemies, tighter patterns, way more things trying to erase you. And every ten waves, the universe throws a curveball: sometimes it’s a boss, sometimes an event where every hit gives bonus score. Whatever shows up, stay sharp, because it can save you or it can bury you. Your score is your currency. Shooting doesn’t cost points, and your shield doesn’t recharge from taking hits; it just comes back on its own after a cooldown, so don’t be afraid to fire, just play smart. In the shop, the first upgrade gives you more bullets per click, perfect for shredding waves. The second makes your shield recharge faster, which can be the difference between living and exploding when things get ugly. And the third upgrade boosts your max health, but you only get three uses, so pick your moment. Survive the waves, grab score, buy upgrades, stay alive. And if you still blow up after all that... well, that’s on you." , time)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(10)
	await escrever($Label, "That’s it. Go on.\n" + " The battlefield won’t wait.", time)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	await wait_timers(1)
	await escrever($Label, " ", time)
	$Control/Control/Circle/AnimatedSprite2D.pause()
	$Control/Control/Circle/AnimatedSprite2D.frame = 0
	Global.intro.play("fade-out")

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

func escrever(label: Label, texto: String, velocidade: float = time) -> void:
	$Control/VBoxContainer/RichTextLabel.text = ""
	for c in texto:
		$Control/VBoxContainer/RichTextLabel.scroll_to_line($Control/VBoxContainer/RichTextLabel.get_line_count() - 1)
		if som == 2:
			$Control/Control/Circle/AnimatedSprite2D.play("default")
			som = 3
			$Control/Selection.play(0)
		if som == 3:
			som = 2
		$Control/VBoxContainer/RichTextLabel.text += c
		await wait_timers(velocidade)
