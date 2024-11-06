extends CharacterBody2D

var velocidad:int = 500
var directionX = null
var directionY = null
var desbloqueoPiso = 0
var body_en_zona = false


@onready var barra_energia = $Barra_e






func _physics_process(delta):
	directionX = Input.get_axis("izquierda", "derecha")
	directionY = Input.get_axis("arriba" , "abajo")
	velocity.x = directionX * velocidad
	velocity.y = directionY * velocidad
	
	velocity.normalized()
	move_and_slide()
	if velocity.x == 0 and velocity.y == 0 :
		$AnimatedSprite2D.play("Reposo")
	else :
		if velocity.y > 0 :
			$AnimatedSprite2D.play("caminado hacia el frente")
		elif velocity.x > 0 :
			$AnimatedSprite2D.play("derecha caminar")
		elif velocity.x < 0:
			$AnimatedSprite2D.play("caminado izquierda")
		elif velocity.y < 0 :
			$AnimatedSprite2D.play("atras caminando")
	

func _input(event):
	if event.is_action_pressed("ui_accept"):
		$Inventario.deleteItem(0)
	if event.is_action_pressed("e"):
		desbloqueoPiso += 20
		print("suma de puntos")
		

func _on_entrada_tumba_body_entered(body):
	if body.get_name() == "player":
		body.global_position = Vector2 (-14900, 12500)


func _on_salida_tumba_body_entered(body):
	if body.get_name() == "player":
		body.global_position = Vector2 (1250,500)


func _on_hitbox_body_entered(body):
	if body.name == "Momia":
		barra_energia.energia_uso(10)
		


	


func _on_escalera_al_segundo_piso_body_entered(body):
	if desbloqueoPiso <= 40:
		if body.get_name() == "player":
			body.global_position = Vector2 (1250,500)
			$CartelPisoBloqueado/Label.visible = true
			$CartelPisoBloqueado/Sprite2D.visible = true



func _on_escalera_al_segundo_piso_body_exited(body):
	pass
	
