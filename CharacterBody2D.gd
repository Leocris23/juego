extends CharacterBody2D




var velocidad = 600
var angulo = 0

func _ready():
	angulo = get_angle_to(get_global_mouse_position())
	

func _physics_process(delta):
	
	var movimiento = Vector2(cos(angulo), sin(angulo)).normalized() * velocidad
	velocity = movimiento
	move_and_slide()
	$Sprite2D.rotation = angulo + 90



func _on_timer_timeout():
	self.queue_free()


func _on_colision_body_entered(body):
	self.queue_free()
