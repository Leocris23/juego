extends Node2D



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Escenas/Pantalla_de_inicio.tscn")


func _on_button_2_pressed():
	get_tree().quit()

func pausa():
	get_tree().paused = true
