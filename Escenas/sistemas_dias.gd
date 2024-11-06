extends Node2D
class_name S_Dia

const  Dias = ["Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo"]


@onready var animacion_dia = $Animacion_dia

var contador_dia = 0:
	set(value):
		contador_dia = value
		%Dia.text = "Dia" + str(contador_dia)
		%DiaDeLaSemana.text = Dias[contador_dia % 7]

func _physics_process(delta):
	var hora_actual = animacion_dia.current_animation_position
	var tiempo_total = animacion_dia.current_animation_length
	
	var paso_de_minutos = (hora_actual/tiempo_total) * (24 * 60)
	
	%Minutos.text = str(int(paso_de_minutos) % 60)
	%Hora.text = str(int(paso_de_minutos / 60 ) % 24)

func Dia_siguiente():
	contador_dia += 1
	
func Dormir():
	Dia_siguiente()
	animacion_dia.seek(87.5, true)  
	animacion_dia.play()
