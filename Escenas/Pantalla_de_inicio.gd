extends PanelContainer

func _ready():
	not get_tree().paused

func _on_inicio_partida_pressed():
	get_tree().change_scene_to_file("res://Escenas/principal.tscn")




func _on_salir_pressed():
	get_tree().quit()
