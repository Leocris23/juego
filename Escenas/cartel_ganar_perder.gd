extends Node2D

func cartel_funcionado():
	get_tree().paused = not get_tree().paused
	$Sprite2D.visible = not $Sprite2D.visible
	$Button.visible = not $Button.visible
	$Button2.visible = not $Button2.visible


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Escenas/Pantalla_de_inicio.tscn")




func _on_button_2_pressed():
	get_tree().quit()
