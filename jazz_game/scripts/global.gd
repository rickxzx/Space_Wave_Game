extends Node
var save_o : bool = true
var n = 0
var ns = 0
var cookie = 0
var peixinho = 0
var arranhador = 0
var novelo = 0
var caixa = 0
var point_multi = 1
var pontos_acum = 0
var final1 : bool = false
var final2 : bool = false
var final3 : bool = false
var final_secret : bool = false
var voltou_denovo : bool = false
var pause_menu : bool = false

var save_point = "user://save_pontos.sav"

func save():
	if save_o == true:
		var file = FileAccess.open(save_point, FileAccess.WRITE)
		file.store_var(final1)
		file.store_var(final2)
		file.store_var(final3)
		file.store_var(final_secret)
		file.store_var(voltou_denovo)

func load_save():
	if save_o == true:
		var file = FileAccess.open(save_point, FileAccess.READ)
		if FileAccess.file_exists(save_point):
			final1 = file.get_var(final1)
			final2 = file.get_var(final2)
			final3 = file.get_var(final3)
			final_secret = file.get_var(final_secret)
			voltou_denovo = file.get_var(voltou_denovo)
		else:
			final1 = false
			final2 = false
			final3 = false
			final_secret = false
			voltou_denovo = false
