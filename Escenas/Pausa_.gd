extends Node

func _physics_process(delta):
	if Input.is_action_just_pressed("pausa"):
		get_tree().paused = not get_tree().paused
		$ColorRect.visible = not $ColorRect.visible
		$Sprite2D.visible = not $Sprite2D.visible
		$Button.visible = not $Button.visible
		$Button2.visible = not $Button2.visible



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Escenas/Pantalla_de_inicio.tscn")


func _on_button_2_pressed():
	get_tree().quit()
