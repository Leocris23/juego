extends CharacterBody2D
class_name Momia

var speed = 300
var salud = 100

var cuerpoplayer = null
var move = Vector2.ZERO

func _process(delta):
	if salud ==0:
		self.queue_free()
		
func _physics_process(delta):
	if cuerpoplayer != null:
		follow()


func follow():
	if cuerpoplayer != null:
		velocity = position.direction_to(cuerpoplayer.position) * speed
		if velocity.x == 0 and velocity.y == 0 :
			$AnimatedSprite2D.play("momia")
		else:
			if velocity.y > 0 :
				$AnimatedSprite2D.play("momiaFre")
			elif velocity.x > 0 :
				$AnimatedSprite2D.play("momiaDer")
			elif velocity.x < 0:
				$AnimatedSprite2D.play("momiaIzq")
			elif velocity.y < 0 :
				$AnimatedSprite2D.play("momiaAtr")
				
		move_and_slide()





func _on_vista_body_entered(body):
	if body.name == "player":
		cuerpoplayer = body




func _on_vista_body_exited(body):
	cuerpoplayer = null
