extends Node2D
var price_shoot = 5000
var price_uti = 1500
var price_life = 500

func _process(_delta: float) -> void:
	$shoot/Label.text = "Price: " + str(price_shoot)
	$uti/Label.text = "Price: " + str(price_uti)
	$life/Label.text = "Price: " + str(price_life)

func _on_buy_pressed() -> void:
	if Global.tiros_por_clique <= 5 and Global.score >= price_shoot:
		Global.tiros_por_clique += 1
		Global.score -= price_shoot
		price_shoot += 5000

func _on_buy_uti_pressed() -> void:
	if Global.uti_time >= 3 and Global.score >= price_uti:
		Global.uti_time -= 0.5
		Global.score -= price_uti
		price_uti += 2000


func _on_buy_life_pressed() -> void:
	if Global.life <= 9 and Global.score >= price_life:
		Global.life = 10
		Global.score -= price_life
		price_life += 500
