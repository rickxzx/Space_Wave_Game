extends Node2D
@export var price_cookie = 10
@export var price_biscoitinho = 100
@export var price_arranhador = 250
@export var price_novelo = 500
@export var price_caixa = 1000
var coo : bool = false
var pei : bool = false
var arr : bool = false
var nov : bool = false
var cai : bool = false
@onready var ganho = preload("res://cenas/ganho.tscn")
@onready var perda = preload("res://cenas/perda.tscn")
var caixa : bool = false
var novelo : bool = false
var arranhador : bool = false
var caixas = 0
var arranhando = 0
var novelos = 0
var total = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LOJA/ColorRect3.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if coo == false:
		Global.n = 0
	if pei == false:
		Global.n = 0
	if arr == false:
		Global.n = 0
	if nov == false:
		Global.n = 0
	if cai == false:
		Global.n = 0
	if coo == true:
		Global.n = -price_cookie
	if pei == true:
		Global.n = -price_biscoitinho
	if arr == true:
		Global.n = -price_arranhador
	if nov == true:
		Global.n = -price_novelo
	if cai == true:
		Global.n = -price_caixa
	if Global.pontos_acum >= 1000000:
		$Node2D2/Node2D/Label2.visible = true
	$"LOJA/lã/price".text = str(price_novelo) + " cliques"
	$LOJA/ColorRect/CockieReal/price.text = str(price_cookie) + " cliques"
	$LOJA/ColorRect3/Biscoito2/Label.text = str(price_biscoitinho) + " cliques"
	$LOJA/arranhador/price.text = str(price_arranhador) + " cliques"
	$LOJA/caixa/price.text = str(price_caixa) + " cliques"

func _on_cookie_pressed() -> void:
	if Global.pontos_acum >= price_cookie and Global.cookie <= 150:
		var money_instance = perda.instantiate()
		$".".add_child(money_instance)
		money_instance.global_position = get_global_mouse_position() * 0.97
		$Node2D/buy.play(0)
		if Global.cookie == 4:
			$Node2D2/AudioStreamPlayer2D.play(0)
			$Node2D2/Node2D/Label3.visible = true
			$AnimationPlayer2.play("novo_iten")
			$LOJA/ColorRect3.visible = true
		Global.n = -price_cookie
		Global.pontos_acum -= price_cookie
		Global.point_multi += 1
		Global.cookie += 1
	if Global.cookie >= 151:
		$LOJA/ColorRect/CockieReal/cookie.visible = false
		$LOJA/ColorRect/CockieReal/cookie.disabled = true


func _on_peixe_biscoito_pressed() -> void:
	if Global.pontos_acum >= price_biscoitinho and Global.peixinho <= 50:
		var money_instance = perda.instantiate()
		$".".add_child(money_instance)
		money_instance.global_position = get_global_mouse_position() * 0.97
		$Node2D/buy.play(0)
		if Global.peixinho == 4:
			$AnimationPlayer2.play("novo_iten")
			$LOJA/arranhador.visible = true
		Global.n = -price_biscoitinho
		Global.pontos_acum -= price_biscoitinho
		Global.point_multi += 3
		Global.peixinho += 1
	if Global.peixinho >= 51:
		$LOJA/ColorRect3/Biscoito2/peixe_biscoito.visible = false
		$LOJA/ColorRect3/Biscoito2/peixe_biscoito.disabled = true
		
func _on_arranhador_buy() -> void:
	if Global.pontos_acum >= price_arranhador and Global.arranhador <= 250:
		var money_instance = perda.instantiate()
		$".".add_child(money_instance)
		money_instance.global_position = get_global_mouse_position() * 0.97
		$Node2D/buy.play(0)
		if arranhador == false:
			$LOJA/arranhador/arranhador_timer.start(0.1)
			arranhador = true
		if Global.arranhador == 4:
			$"LOJA/lã".visible = true
			$AnimationPlayer2.play("novo_iten")
		Global.n = -price_arranhador
		Global.pontos_acum -= price_arranhador
		Global.arranhador += 1
		arranhando += 2
		price_arranhador += 100
	if Global.arranhador >= 251:
		$LOJA/arranhador/comprar.visible = false
		$LOJA/arranhador/comprar.disabled = true

func _on_arranhador_timer_timeout() -> void:
	if arranhador == true and novelo == false:
		Global.pontos_acum += arranhando 
		Global.ns = arranhando 
	if novelo == true and caixa == false:
		Global.pontos_acum += arranhando 
		Global.pontos_acum += novelos
		Global.ns = novelos + arranhando 
	if caixa == true:
		Global.pontos_acum += caixas
		Global.pontos_acum += arranhando 
		Global.pontos_acum += novelos
		Global.ns = novelos + arranhando + caixas
	var money_instance = ganho.instantiate()
	$Camera2D/PONTOS.add_child(money_instance)
	money_instance.global_position = $Camera2D/Node2D.global_position

func _on_novelo_lã_pressed() -> void:
	if Global.pontos_acum >= price_novelo and Global.novelo <= 250:
		var money_instance = perda.instantiate()
		$".".add_child(money_instance)
		money_instance.global_position = get_global_mouse_position() * 0.97
		$Node2D/buy.play(0)
		if novelo == false:
			novelo = true
		if Global.novelo == 4:
			$LOJA/caixa.visible = true
			$AnimationPlayer2.play("novo_iten")
		Global.n = -price_novelo
		Global.pontos_acum -= price_novelo
		Global.novelo += 1
		novelos += 5
		price_novelo += 150
	if Global.novelo >= 251:
		$"LOJA/lã/novelo_lã".visible = false
		$"LOJA/lã/novelo_lã".disabled = true

func _on_animation_player_2_animation_finished(anim_name: StringName) -> void:
	$Label.visible = false

func _on_caixa_pressed() -> void:
	if Global.pontos_acum >= price_caixa and Global.caixa <= 500:
		var money_instance = perda.instantiate()
		$".".add_child(money_instance)
		money_instance.global_position = get_global_mouse_position() * 0.97
		$Node2D/buy.play(0)
		if caixa == false:
			caixa = true
		if Global.caixa == 4:
			pass
		Global.n = -price_caixa
		Global.pontos_acum -= price_caixa
		Global.caixa += 1
		caixas += 10
		price_caixa += 200
	if Global.caixa >= 501:
		$LOJA/caixa/caixa.visible = false
		$LOJA/caixa/caixa.disabled = true


func _on_timer_timeout_musica() -> void:
	$Node2D/musica.play(0)


func _on_cookie_mouse_entered() -> void:
	coo = true


func _on_peixe_biscoito_mouse_entered() -> void:
	pei = true


func _on_comprar_mouse_entered() -> void:
	arr = true


func _on_novelo_lã_mouse_entered() -> void:
	nov = true


func _on_caixa_mouse_entered() -> void:
	cai = true


func _on_cookie_mouse_exited() -> void:
	coo = false


func _on_peixe_biscoito_mouse_exited() -> void:
	pei = false


func _on_comprar_mouse_exited() -> void:
	arr = false


func _on_novelo_lã_mouse_exited() -> void:
	nov = false


func _on_caixa_mouse_exited() -> void:
	cai = false
