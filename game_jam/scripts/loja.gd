extends Node2D
var price_shoot = 5000
var price_uti = 1500
var price_life = 500
var shoot_quant = 5
var uti_quant = 24
var life_quant = 3


func _process(_delta: float) -> void:
	if Global.tiros_por_clique <= 5:
		$shoot/Label.text = "Price: " + str(price_shoot) + "  X" + str(shoot_quant)
	if Global.uti_time >= 3:
		$uti/Label.text = "Price: " + str(price_uti) + "  X" + str(uti_quant)
	if life_quant <= 5 and life_quant >= 1:
		$life/Label.text = "Price: " + str(price_life) + "  X" + str(life_quant)
		$life/buy_life.visible = true
	if Global.tiros_por_clique >= 5:
		$shoot/Label.text = "SOLD OUT"
		$shoot/buy.visible = false
	if Global.uti_time <= 3:
		$uti/Label.text = "SOLD OUT"
		$uti/buy_uti.visible = false
	if life_quant <= 0:
		$life/Label.text = "SOLD OUT"
		$life/buy_life.visible = false

func _on_buy_pressed() -> void:
	if Global.tiros_por_clique <= 5 and Global.score >= price_shoot:
		shoot_quant -= 1
		$Pay.play(0)
		Global.tiros_por_clique += 1
		Global.score -= price_shoot
		price_shoot += 5000

func _on_buy_uti_pressed() -> void:
	if Global.uti_time >= 3 and Global.score >= price_uti:
		uti_quant -= 1
		$Pay.play(0)
		Global.uti_time -= 0.5
		Global.score -= price_uti
		price_uti += 2000


func _on_buy_life_pressed() -> void:
	if Global.life <= 9 and Global.score >= price_life:
		life_quant -= 1
		$Pay.play(0)
		Global.life = 10
		Global.score -= price_life
		price_life += 500
